require 'posto/template'

module Posto
  class File
    def initialize(filename)
      @filename = filename
    end

    def write(items)
      IO.write(@filename, Template.todo_list(items))
    end

    def lines
      IO.read(@filename).split("\n")
    end
  end
end
