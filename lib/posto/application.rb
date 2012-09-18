require 'posto/list'
require 'posto/file'

module Posto
  class Application
    attr_reader :todos
    alias :list :todos
    def initialize(arguments)
      @arguments = arguments
      @list_utility = List
      @io = STDOUT
      @file = Posto::File.new(@arguments.filename)
      @todos = @file.todos
    end

    def run
      @io.puts send(@arguments.command, *@arguments.params)
    end

    [:sort, :resort].each do |method|
      define_method method do
        @file.write @list_utility.send(method, todos)
      end
    end

    [:unsort, :done, :delete, :do, :top, :quick].each do |method|
      define_method method do |n = 1|
        @file.write @list_utility.send(method, todos, n.to_i)
        lookup(n)
      end
    end

    def add(todo)
      @file.write @list_utility.add(todos, todo)
      todo
    end

    def commit(n = 1)
      @file.commit(done(n))
    end

    def init
      @file.touch
      nil
    end

    def lookup(n)
      Posto::Todo.hide_markdown(todos[n.to_i - 1])
    end

    def method_missing(symbol, *args)
      STDERR.puts "Unsupported operation '#{symbol} #{args.join "\n"}'"
    end
  end
end