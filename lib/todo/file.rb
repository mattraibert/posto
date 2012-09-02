require 'todo/template'

module Todo
  class File
    def initialize(filename)
      @filename = filename
    end

    def write(items)
      todo_list = Template.todo_list(items)
      puts todo_list
      IO.write(@filename, todo_list)
    end

    def lines
      IO.read(@filename).split("\n")
    end
  end
end
