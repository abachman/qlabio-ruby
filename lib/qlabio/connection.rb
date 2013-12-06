require 'httparty'
require 'ostruct'

module QLabIo
  class Connection
    include HTTParty
    format :json

    # debug_output
    base_uri 'https://qlab.io'

    def initialize(token)
      @default_headers = {
        "Accept" => "*/*",
        "Authorization" => %[Token token="#{token}"]
      }
    end

    def machines
      self.class.get("/api/machines", headers: @default_headers).parsed_response.map do |machine_json|
        # materialize machines and workspaces
        machine = Machine.new(self, machine_json)
        machine.workspaces = machine.workspaces.map {|ws| Workspace.new(machine, ws)}
        machine
      end
    end

    def command machine_id, workspace_id, command
      body = {command: command}
      body[:workspace_id] = workspace_id if workspace_id

      self.class.post("/api/machines/#{ machine_id }/command",
                      body: body,
                      headers: @default_headers
      ).parsed_response
    end
  end
end
