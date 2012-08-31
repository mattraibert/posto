require 'todo/util'

module Todo
  class Application
    def initialize(file)
      @items = Todo::Util.choose_item_lines(file.lines)
      @file = file
    end

    def sort
      @items = Todo::Util.sort(@items)
    end

    def unsort(n = 1)
      @items = Todo::Util.unsort(@items, n.to_i)
    end

    def done(n = 1)
      @items = Todo::Util.done(@items, n.to_i)
    end

    def add(item)
      @items = Todo::Util.add(@items, item)
    end

    def method_missing(symbol, *args)
      STDERR.puts "Unsupported operation '#{symbol} #{args.join " "}'"
    end

    def write
      puts @items
      @file.write(@items)
    end
  end
end