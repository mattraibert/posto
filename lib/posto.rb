require 'highline/import'
require 'posto/arguments'
require 'posto/application'
require 'posto/file'
require 'posto/list'

module Posto
  class << self
    def main(args)
      arguments = Arguments.new(args)
      todos = File.new(arguments.filename).lines
      Application.new(arguments).run(todos)
    end
  end
end