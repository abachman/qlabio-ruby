require "qlabio/version"
require 'qlabio/connection'
require 'qlabio/machine'
require 'qlabio/workspace'

module QLabIo
  class << self
    def connect username, password
      Connection.new(username, password)
    end
  end
end

