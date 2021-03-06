require 'posto/arguments'
require 'posto/application'
require 'posto/file'
require 'posto/list'

module Posto
  class << self
    def main(args)
      arguments = Arguments.new(args)
      todos = Posto::File.new(arguments.filename).todos
      Application.new(arguments, todos).run
    end
  end
end