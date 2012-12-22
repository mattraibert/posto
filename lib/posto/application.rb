require 'posto/list'
require 'posto/file'
require 'posto/help'

module Posto
  class Application
    attr_accessor :todos, :io, :file
    alias :list :todos

    def initialize(arguments, todos, options = {})
      @io = options[:io] || STDOUT
      @list_utility = options[:list_utility] || List
      @file = options[:file] || Posto::File.new(arguments.filename)
      @arguments = arguments
      @todos = todos
    end

    def help
      @io.puts Posto::Help.help_text
    end

    def run
      @io.puts send(@arguments.command, *@arguments.params)
    end

    [:sort, :resort].each do |method|
      define_method method do
        @file.write(@list_utility.send(method, todos))
      end
    end

    [:unsort, :done, :delete, :do, :top, :quick].each do |method|
      define_method method do |n = 1|
        @file.write @list_utility.send(method, todos, n.to_i)
        @list_utility.lookup(todos, n)
      end
    end

    def add(todo)
      @file.write @todos = @list_utility.add(todos, todo)
      todo
    end

    def start(todo)
      add(todo)
      @file.commit_alone("scheduled '#{todo}'")
    end
    alias :schedule :start

    def commit(n = 1)
      @file.commit("#{done(n)}")
    end

    def oops
      @file.oops
    end

    def init
      @file.touch
      nil
    end

    def method_missing(symbol, *args)
      STDERR.puts "Unsupported operation '#{symbol} #{args.join "\n"}'"
    end
  end
end