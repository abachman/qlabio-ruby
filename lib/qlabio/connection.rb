require 'httparty'

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
      self.class.get("/api/machines", headers: @default_headers).parsed_response
    end

    def command machine_id, workspace_id, command
      self.class.post("/api/machines/#{ machine_id }/command", body: {
        workspace_id: workspace_id,
        command: command
      }, headers: @default_headers).parsed_response
    end
  end
end
