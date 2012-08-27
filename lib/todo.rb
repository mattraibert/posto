require 'highline/import'
require 'todo/util'
require 'todo/todo_list_template'

module Todo
  class << self
    def main(args)
      items = items = Todo::Util.choose_item_lines(IO.read("todo.md").split("\n"))
      case args[0]
        when nil
          items = Todo::Util.sort(items)
        else
          print "Unsupported operation #{args.inspect}"
      end
      puts items
      IO.write("todo.md", todo_list(items))
    end
  end
end