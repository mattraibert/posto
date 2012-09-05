require 'posto/template'

module Posto
  class File
    def initialize(filename)
      @filename = filename
    end

    def write(items)
      todo_list = Template.todo_list(items)
      IO.write(@filename, todo_list)
    end

    def lines
      IO.read(@filename).split("\n")
    end
  end
end
