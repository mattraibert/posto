require 'posto/list'

module Posto
  class Application
    def initialize(arguments, list = List, io = STDOUT)
      @arguments = arguments
      @list = list
      @io = io
    end

    def run(items)
      send(@arguments.command, items, *@arguments.params)
    end

    def list(items)
      @io.puts items
      items
    end

    def sort(items)
      list @list.sort(items)
    end

    def unsort(items, n = 1)
      list @list.unsort(items, n.to_i)
    end

    def resort(items)
      list @list.resort(items)
    end

    def done(items, n = 1)
      list @list.done(items, n.to_i)
    end

    def add(items, item)
      list @list.add(items, item)
    end

    def top(items, n = 1)
      list @list.top(items, n.to_i)
    end

    def quick(items, n = 1)
      list @list.quick(items, n.to_i)
    end

    def method_missing(symbol, *args)
      STDERR.puts "Unsupported operation '#{symbol} #{args.join " "}'"
    end
  end
end