require 'posto/list'

module Posto
  class Application
    def initialize(arguments, list = List)
      @arguments = arguments
      @list = list
    end

    def run(items)
      send(@arguments.command, items, *@arguments.params)
    end

    def list(items)
      items
    end

    def sort(items)
      @list.sort(items)
    end

    def unsort(items, n = 1)
      @list.unsort(items, n.to_i)
    end

    def resort(items)
      @list.resort(items)
    end

    def done(items, n = 1)
      @list.done(items, n.to_i)
    end

    def add(items, item)
      @list.add(items, item)
    end

    def quick(items, n = 1)
      @list.quick(items, n.to_i)
    end

    def method_missing(symbol, *args)
      STDERR.puts "Unsupported operation '#{symbol} #{args.join " "}'"
    end
  end
end