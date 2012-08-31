require 'todo/list'

module Todo
  class Application
    def initialize(file)
      @items = Todo::List.choose_item_lines(file.lines)
      @file = file
    end

    def sort(n)
      @items = Todo::List.sort(@items)
    end

    def unsort(n)
      @items = Todo::List.unsort(@items, n)
    end

    def done(n)
      @items = Todo::List.done(@items, n)
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