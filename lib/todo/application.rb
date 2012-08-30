require 'todo/util'
require 'todo/command'

module Todo
  class Application
    def initialize(file, arguments)
      @arguments = arguments
      @items = Todo::Util.choose_item_lines(file.lines)
      @file = file

      cli 'sort' do
        @items = Todo::Util.sort(@items)
      end

      cli 'unsort [n]' do |n|
        @items = Todo::Util.unsort(@items, n)
      end

      cli 'done [n]' do |n|
        @items = Todo::Util.done(@items, n)
      end

      cli 'add [item]' do |item|
        @items = Todo::Util.add(@items, item)
      end
    end

    def run
      @commands[@arguments.command].block.call(@arguments.item_number)
    end

    def cli(command, opts={}, &block)
      @commands ||= {}
      command = Todo::Command.new(command, block)
      @commands[command.name]= command
    end

    def write
      puts @items
      @file.write(@items)
    end
  end
end