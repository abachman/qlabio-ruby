require 'httparty'
require 'ostruct'

module QLabIo
  class Connection
    include HTTParty
    format :json

    # debug_output
    base_uri 'https://qlab.io'
    # base_uri 'http://qlab.io.dev'

    def initialize(username, password)
      @default_headers = {
        "Accept" => "*/*"
      }

      login(username, password)
    end

    def set_authorization_header(token)
      @default_headers["Authorization"] = %[Token token="#{token}"]
    end

    def login(username, password)
      # retrieve access token
      response = self.class.post("/embedded/login", query: {user: {email: username, password: password}})
      set_authorization_header(response.parsed_response['token'])
    end

    # return a list of QLab machines
    def machines
      self.class.get("/api/machines", :headers => @default_headers).parsed_response.map do |machine_json|
        # materialize machines and workspaces
        machine = Machine.new(self, machine_json)
        machine.workspaces = machine.workspaces.map {|ws| Workspace.new(machine, ws)}
        machine
      end
    end

    # run a command on a given machine
    def command(machine_id, workspace_id, command)
      body = {:command => command}
      body[:workspace_id] = workspace_id if workspace_id

      self.class.post("/api/machines/#{ machine_id }/command",
                      :body => body,
                      :headers => @default_headers).parsed_response
    end
  end
end
