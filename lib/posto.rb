require 'highline/import'
require 'posto/arguments'
require 'posto/application'
require 'posto/file'
require 'posto/list'

module Posto
  class << self
    def main(args)
      Application.new(Arguments.new(args)).run
    end
  end
end