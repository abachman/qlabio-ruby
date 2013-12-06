module QLabIo
  class Workspace < OpenStruct
    def initialize machine, hash
      super hash
      @machine = machine
    end

    def command command_string
      @machine.connection.command @machine.id, self.id, command_string
    end
  end
end
