require 'todo/util'

module Todo
  class Application
    def initialize(file)
      @items = Todo::Util.choose_item_lines(file.lines)
      @file = file
    end

    def sort(n)
      @items = Todo::Util.sort(@items)
    end

    def unsort(n)
      @items = Todo::Util.unsort(@items, n)
    end

    def done(n)
      @items = Todo::Util.done(@items, n)
    end

    def method_missing(symbol, *args)
      STDERR.puts "Unsupported operation '#{symbol} #{args.join " "}'" unless symbol == :stderr
    end

    def write
      puts @items
      @file.write(@items)
    end
  end
end