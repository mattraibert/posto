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

    attr_accessor :io, :list_utility, :file

    def run(items)
      send(@arguments.command, items, *@arguments.params)
    end

    def list(items)
      @io.puts items
      items
    end

    def sort(items)
      list @list_utility.sort(items)
    end

    def resort(items)
      list @list_utility.resort(items)
    end

    def unsort(items, n = 1)
      list @list_utility.unsort(items, n.to_i)
    end

    def done(items, n = 1)
      list @list_utility.done(items, n.to_i)
    end

    def top(items, n = 1)
      list @list_utility.top(items, n.to_i)
    end

    def quick(items, n = 1)
      list @list_utility.quick(items, n.to_i)
    end

    def add(items, item)
      list @list_utility.add(items, item)
    end

    def method_missing(symbol, *args)
      STDERR.puts "Unsupported operation '#{symbol} #{args.join " "}'"
    end
  end
end