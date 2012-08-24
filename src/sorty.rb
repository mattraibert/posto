require 'highline/import'
require 'sorty_util'
require 'todo_list_template'

def ask_human_to_compare(x, y)
  while true do
    puts "1. #{hide_markdown x}"
    puts "2. #{hide_markdown y}"
    response = ask "which one is more important? (1, 2 or just hit enter if you don't care): "
    return 0 if response.to_i == 0
    return -1 if response.to_i == 1
    return 1 if response.to_i == 2
  end
end

def main
  items = choose_item_lines(IO.read("todo.md").split("\n"))
  items = items.sort { |x, y| compare_sorted_items(x, y) or ask_human_to_compare(x, y) }
  items = replace_stars_with_ordinal_numbers(items)
  puts items
  IO.write("todo.md", todo_list(items))
end

main
