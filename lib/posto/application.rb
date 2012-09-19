require 'posto/list'
require 'posto/file'

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
      sort
      @file.commit_alone("[posto] adding '#{todo}'")
    end

    def commit(n = 1)
      @file.commit(done(n))
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