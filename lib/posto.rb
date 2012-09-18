require 'highline/import'
require 'posto/arguments'
require 'posto/application'
require 'posto/file'
require 'posto/list'

module Posto
  class << self
    def main(args)
      todos = Posto::File.new(arguments.filename)
      Application.new(Arguments.new(args), todos).run
    end
  end
end