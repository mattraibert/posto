require 'highline/import'

def compare x, y
  while true do
    puts "0. neither"
    puts "1. #{x}"
    puts "2. #{y}"
    response = ask "type which one is more important (0,1 or 2): "
    return 0 if response.to_i == 0
    return -1 if response.to_i == 1
    return 1 if response.to_i == 2
  end
end

items = IO.read("todo.md").split("\n").select{|line| /^\*/ =~ line }
items = items.sort { |x, y| compare x, y }
puts items
