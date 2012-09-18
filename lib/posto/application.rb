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

    def list(todos)
      todos
    end

    def run(todos)
      @io.puts send(@arguments.command, todos, *@arguments.params)
    end

    [:sort, :resort].each do |method|
      define_method method do |todos|
        @file.write @list_utility.send(method, todos)
      end
    end

    [:unsort, :done, :delete, :do, :top, :quick].each do |method|
      define_method method do |todos, n = 1|
        @file.write @list_utility.send(method, todos, n.to_i)
        lookup(todos, n)
      end
    end

    def add(todos, todo)
      @file.write @list_utility.add(todos, todo)
      todo
    end

    def commit(todos, n = 1)
      @file.commit(done(todos, n))
    end

    def init(todos)
      @file.touch
      nil
    end

    def lookup(todos, n)
      Posto::Todo.hide_markdown(todos[n.to_i - 1])
    end

    def method_missing(symbol, *args)
      STDERR.puts "Unsupported operation '#{symbol} #{args.join "\n"}'"
    end
  end
end