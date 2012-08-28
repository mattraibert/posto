require 'highline/import'
require 'todo/util'
require 'todo/arguments'
require 'todo/todo_list_template'

module Todo
  class << self
    def main(args)
      arguments = Arguments.new(args)
      app = Application.new(TodoFile.new(arguments))
      case arguments.command
        when "sort"
          app.sort
        when "unsort"
          app.unsort(arguments.item_number)
        when "done"
          app.done(arguments.item_number)
        else
          app.unknown(arguments.to_s)
      end
      app.write
    end
  end

  class Application
    def initialize(file)
      @items = Todo::Util.choose_item_lines(file.lines)
      @file = file
    end

    def sort
      @items = Todo::Util.sort(@items)
    end

    def unsort(n)
      @items = Todo::Util.unsort(@items, n)
    end

    def done(n)
      @items = Todo::Util.done(@items, n)
    end

    def unknown(args)
      print "Unsupported operation #{args}"
    end

    def write
      puts @items
      @file.write(@items)
    end
  end

  class TodoFile
    def initialize(arguments)
      @filename = arguments.filename
    end

    def write(items)
      IO.write(@filename, todo_list(items))
    end

    def lines
      IO.read(@filename).split("\n")
    end
  end
end