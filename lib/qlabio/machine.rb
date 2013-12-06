module QLabIo
  class Machine < OpenStruct
    def initialize connection, hash
      super hash
      @connection = connection
    end

    def connection; @connection; end
  end
end
