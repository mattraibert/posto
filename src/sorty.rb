require 'highline/import'
require 'sorty_util'

def compare(x, y)
  while true do
    puts "1. #{x}"
    puts "2. #{y}"
    response = ask "type which one is more important (1, 2 or no entry if you don't care): "
    return 0 if response.to_i == 0
    return -1 if response.to_i == 1
    return 1 if response.to_i == 2
  end
end

items = choose_item_lines(IO.read("todo.md").split("\n"))
items = items.sort { |x, y| compare x, y }
puts replace_stars_with_ordinal_numbers(items)
