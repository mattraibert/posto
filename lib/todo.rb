require 'highline/import'
require 'todo/util'
require 'todo/arguments'
require 'todo/todo_list_template'

module Todo
  class << self
    def main(args)
      arguments = Arguments.new(args)
      items = Todo::Util.choose_item_lines(IO.read(arguments.filename).split("\n"))
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
      IO.write(arguments.filename, todo_list(items))
    end
  end
end