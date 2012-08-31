require 'highline/import'
require 'todo/arguments'
require 'todo/application'
require 'todo/file'

module Todo
  class << self
    def main(args)
      arguments = Arguments.new(args)
      file = Todo::File.new(arguments.filename)
      app = Todo::Application.new(file)
      app.send(arguments.command, *arguments.params)
      app.write
    end
  end
end