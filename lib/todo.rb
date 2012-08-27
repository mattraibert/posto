require 'highline/import'
require 'todo/util'
require 'todo/arguments'
require 'todo/todo_list_template'

module Todo
  class << self
    def main(args)
      arguments = Arguments.new(args)
      file = TodoFile.new(arguments)
      items = Todo::Util.choose_item_lines(file.lines)
      case arguments.command
        when "sort"
          items = Todo::Util.sort(items)
        when "unsort"
          items = Todo::Util.unsort(items, arguments.item_number)
        when "done"
          items = Todo::Util.done(items, arguments.item_number)
        else
          print "Unsupported operation #{args.inspect}"
      end
      puts items
      file.write(items)
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