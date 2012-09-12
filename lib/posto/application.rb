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
      items = @list_utility.unsort(items, n.to_i)
      @io.puts items.last
      @file.write items
    end

    def done(items, n = 1)
      @io.print items[n - 1]
      @file.write @list_utility.done(items, n.to_i)
    end

    def top(items, n = nil)
      return @io.print items.first unless n
      @io.print items[n - 1]
      @file.write @list_utility.top(items, n.to_i)
    end

    def quick(items, n = 1)
      items = @list_utility.quick(items, n.to_i)
      @io.puts items
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
  end
end