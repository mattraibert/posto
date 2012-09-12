require 'posto/list'
require 'posto/file'

module Posto
  class Application
    def initialize(arguments)
      @arguments = arguments
      @list_utility = List
      @io = STDOUT
      @file = Posto::File.new(@arguments.filename)
    end

    def list(items)
      print_all items
    end

    def run(items)
      send(@arguments.command, items, *@arguments.params)
    end

    def sort(items)
      @file.write @list_utility.sort(items)
    end

    def resort(items)
      @file.write @list_utility.resort(items)
    end

    def unsort(items, n = 1)
      print_item(items, n)
      @file.write @list_utility.unsort(items, n.to_i)
    end

    def done(items, n = 1)
      print_item(items, n)
      @file.write @list_utility.done(items, n.to_i)
    end

    def top(items, n = nil)
      if n.nil?
        print_item(items)
      else
        print_item(items, n)
        @file.write @list_utility.top(items, n.to_i)
      end
    end

    def quick(items, n = 1)
      items = @list_utility.quick(items, n.to_i)
      print_all(items)
      @file.write items
    end

    def add(items, item)
      items = @list_utility.add(items, item)
      @io.puts items
      @file.write items
    end

    def method_missing(symbol, *args)
      STDERR.puts "Unsupported operation '#{symbol} #{args.join " "}'"
    end

    def print_item(items, n = 1)
      @io.puts Posto::Item.hide_markdown(items[n - 1])
    end

    def print_all(items)
      @io.puts items
    end
  end
end