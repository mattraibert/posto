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
      items
    end

    def run(items)
      @io.puts send(@arguments.command, items, *@arguments.params)
    end

    def sort(items)
      @file.write @list_utility.sort(items)
    end

    def resort(items)
      @file.write @list_utility.resort(items)
    end

    def unsort(items, n = 1)
      @file.write @list_utility.unsort(items, n.to_i)
      lookup_item(items, n)
    end

    def done(items, n = 1)
      @file.write @list_utility.done(items, n.to_i)
      lookup_item(items, n)
    end

    def top(items, n = 1)
      @file.write @list_utility.top(items, n.to_i)
      lookup_item(items, n)
    end

    def quick(items, n = 1)
      @file.write @list_utility.quick(items, n.to_i)
      lookup_item(items, n)
    end

    def add(items, item)
      @file.write @list_utility.add(items, item)
      item
    end

    def commit(items, n = 1)
      @file.commit(done(items, n))
    end

    def lookup_item(items, n)
      Posto::Item.hide_markdown(items[n.to_i - 1])
    end

    def method_missing(symbol, *args)
      STDERR.puts "Unsupported operation '#{symbol} #{args.join " "}'"
    end
  end
end