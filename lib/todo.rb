require 'highline/import'
require 'todo/util'
require 'todo/todo_list_template'

module Todo
  class << self
    def main(args)
      items = items = Todo::Util.choose_item_lines(IO.read("todo.md").split("\n"))
      command = args[0] || "sort"
      item_number = (args[1] || 1).to_i
      case command
        when "sort"
          items = Todo::Util.sort(items)
        when "unsort"
          items = Todo::Util.unsort(items, item_number)
        else
          print "Unsupported operation #{args.inspect}"
      end
      puts items
      IO.write("todo.md", todo_list(items))
    end
  end
end