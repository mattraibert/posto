require 'posto/list'

module Posto
  class Application
    def initialize(arguments, items, list = List)
      @arguments = arguments
      @items = items
      @list = list
    end

    def run
      send(@arguments.command, *@arguments.params)
    end

    def list
      @items
    end

    def sort
      @list.sort(@items)
    end

    def unsort(n = 1)
      @list.unsort(@items, n.to_i)
    end

    def resort
      @list.resort(@items)
    end

    def done(n = 1)
      @list.done(@items, n.to_i)
    end

    def add(item)
      @list.add(@items, item)
    end

    def quick(n = 1)
      @list.quick(@items, n.to_i)
    end

    def method_missing(symbol, *args)
      STDERR.puts "Unsupported operation '#{symbol} #{args.join " "}'"
    end
  end
end