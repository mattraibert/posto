require 'highline/import'
require 'todo/util'
require 'todo/arguments'
require 'todo/todo_list_template'

module Todo
  class << self
    def main(args)
      arguments = Arguments.new(args)
      app = Application.new(TodoFile.new(arguments))
      app.send(arguments.command, arguments.item_number)
      app.write
    end
  end

  class Application
    def initialize(file)
      @items = Todo::Util.choose_item_lines(file.lines)
      @file = file
    end

    def sort(n)
      @items = Todo::Util.sort(@items)
    end

    def unsort(n)
      @items = Todo::Util.unsort(@items, n)
    end

    def done(n)
      @items = Todo::Util.done(@items, n)
    end

    def method_missing(symbol, *args)
      STDERR.puts "Unsupported operation '#{symbol} #{args.join " "}'" unless symbol == :stderr
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