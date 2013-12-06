require "qlabio/version"
require 'qlabio/connection'
require 'qlabio/machine'
require 'qlabio/workspace'

module QLabIo
  class << self
    def connect token
      Connection.new(token)
    end
  end
end

