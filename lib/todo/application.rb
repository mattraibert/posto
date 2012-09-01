require 'todo/list'

module Todo
  class Application
    def initialize(arguments, items, list = Todo::List)
      @arguments = arguments
      @items = items
      @list = list
    end

    def run
      send(@arguments.command, *@arguments.params)
      puts @items
      @items
    end

    def sort
      @items = @list.sort(@items)
    end

    def unsort(n = 1)
      @items = @list.unsort(@items, n.to_i)
    end

    def done(n = 1)
      @items = @list.done(@items, n.to_i)
    end

    def add(item)
      @items = @list.add(@items, item)
    end

    def method_missing(symbol, *args)
      STDERR.puts "Unsupported operation '#{symbol} #{args.join " "}'"
    end
  end
end