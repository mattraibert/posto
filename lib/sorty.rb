require 'highline/import'
require 'sorty/util'
require 'sorty/todo_list_template'

module Sorty
  class << self
    def ask_human_to_compare(x, y)
      while true do
        puts "1. #{Sorty::Util.hide_markdown x}"
        puts "2. #{Sorty::Util.hide_markdown y}"
        response = ask "which one is more important? (1, 2 or just hit enter if you don't care): "
        return 0 if response.to_i == 0
        return -1 if response.to_i == 1
        return 1 if response.to_i == 2
      end
    end

    def main
      items = Sorty::Util.choose_item_lines(IO.read("todo.md").split("\n"))
      items = items.sort { |x, y| Sorty::Util.compare_sorted_items(x, y) or ask_human_to_compare(x, y) }
      items = Sorty::Util.replace_stars_with_ordinal_numbers(items)
      puts items
      IO.write("todo.md", todo_list(items))
    end
  end
end