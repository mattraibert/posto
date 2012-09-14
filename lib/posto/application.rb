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

    def sort(todos)
      @file.write @list_utility.sort(todos)
    end

    def resort(todos)
      @file.write @list_utility.resort(todos)
    end

    def unsort(todos, n = 1)
      @file.write @list_utility.unsort(todos, n.to_i)
      lookup(todos, n)
    end

    def done(todos, n = 1)
      @file.write @list_utility.done(todos, n.to_i)
      lookup(todos, n)
    end

    def top(todos, n = 1)
      @file.write @list_utility.top(todos, n.to_i)
      lookup(todos, n)
    end

    def quick(todos, n = 1)
      @file.write @list_utility.quick(todos, n.to_i)
      lookup(todos, n)
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
      STDERR.puts "Unsupported operation '#{symbol} #{args.join " "}'"
    end

    alias :delete :done
    alias :do :top
  end
end