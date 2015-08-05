module QLabIo
  # pull in fields from QLab.io
  class Machine < OpenStruct
    def initialize connection, hash
      super hash
      @connection = connection
    end

    def connection; @connection; end

    # Send a command directly to a machine
    def command command_string
      connection.command self.id, nil, command_string
    end
  end
end
