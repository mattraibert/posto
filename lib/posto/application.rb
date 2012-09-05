require 'posto/list'

module Posto
  class Application
    def initialize(arguments, list)
      @arguments = arguments
      @list = list
    end

    def run
      send(@arguments.command, *@arguments.params)
    end

    def sort
      @list.sort
    end

    def unsort(n = 1)
      @list.unsort(n.to_i)
    end

    def resort
      @list.resort
    end

    def done(n = 1)
      @list.done(n.to_i)
    end

    def add(item)
      @list.add(item)
    end

    def quick(n = 1)
      @list.quick(n.to_i)
    end

    def method_missing(symbol, *args)
      STDERR.puts "Unsupported operation '#{symbol} #{args.join " "}'"
    end
  end
end