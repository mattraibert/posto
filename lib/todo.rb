require 'highline/import'
require 'todo/util'
require 'todo/todo_list_template'

module Todo
  class << self
    def ask_human_to_compare(x, y)
      while true do
        puts "1. #{Todo::Util.hide_markdown x}"
        puts "2. #{Todo::Util.hide_markdown y}"
        response = ask "which one is more important? (1, 2 or just hit enter if you don't care): "
        return 0 if response.to_i == 0
        return -1 if response.to_i == 1
        return 1 if response.to_i == 2
      end
    end

    def main(args)
      items = items = Todo::Util.choose_item_lines(IO.read("todo.md").split("\n"))
      case args[0]
        when nil
          items = items.sort { |x, y| Todo::Util.compare_sorted_items(x, y) or ask_human_to_compare(x, y) }
          items = Todo::Util.replace_stars_with_ordinal_numbers(items)
        else
          print "Unsupported operation #{args.inspect}"
      end
      puts items
      IO.write("todo.md", todo_list(items))
    end
  end
end