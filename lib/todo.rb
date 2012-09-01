require 'highline/import'
require 'todo/arguments'
require 'todo/application'
require 'todo/file'
require 'todo/list'

module Todo
  class << self
    def main(args)
      arguments = Arguments.new(args)
      file = Todo::File.new(arguments.filename)
      items = Todo::List.choose_item_lines(file.lines)
      result = Todo::Application.new(arguments, items).run
      file.write(result)
    end
  end
end