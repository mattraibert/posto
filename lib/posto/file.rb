require 'posto/template'
require 'posto/list'

module Posto
  class File
    def initialize(filename)
      @filename = filename
    end

    def write(todos)
      IO.write(@filename, Template.todo_list(todos))
    end

    def commit(msg)
      `git add #@filename`
      `git commit -m "#{msg}"`
    end

    def touch
      `touch #@filename`
    end

    def lines
      if ::File.exists? @filename
        List.choose_todo_lines(IO.read(@filename).split("\n"))
      else
        []
      end
    end
  end
end
