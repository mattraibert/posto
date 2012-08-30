require 'todo/util'

module Todo
  class Application
    def initialize(file)
      @items = Todo::Util.choose_item_lines(file.lines)
      @file = file
    end

    def cli(command, opts={}, &block)
      @commands ||= {}
      @commands[command]= block
    end

    cli 'sort' do
      @items = Todo::Util.sort(@items)
    end

    cli 'unsort :n' do |n|
      @items = Todo::Util.unsort(@items, n)
    end

    def done(n)
      @items = Todo::Util.done(@items, n)
    end

    def method_missing(symbol, *args)
      command = @commands[symbol.to_sym]
      return command.call if(command)
      STDERR.puts "Unsupported operation '#{symbol} #{args.join " "}'"
    end

    def write
      puts @items
      @file.write(@items)
    end
  end
end