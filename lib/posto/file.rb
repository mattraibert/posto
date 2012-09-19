require 'posto/list'

module Posto
  class File
    def initialize(filename)
      @filename = filename
    end

    def write(todos)
      IO.write(@filename, template(todos))
    end

    def commit(msg)
      `git add #@filename`
      `git commit -m "#{msg}"`
    end

    def commit_alone(msg)
      `git commit -m "#{msg}" #@filename`
    end

    def touch
      `touch #@filename`
    end

    def todos
      if ::File.exists? @filename
        List.choose_todo_lines(IO.read(@filename).split("\n"))
      else
        []
      end
    end

    def template(todos)
      "todo\n----\n\n#{todos.join("\n")}\n"
    end
  end
end
