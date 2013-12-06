require "qlabio/version"
require 'qlabio/connection'

module QLabIo
  class << self
    def connect token
      Connection.new(token)
    end
  end
end

