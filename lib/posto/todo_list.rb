require 'posto/todo'

class TodoList
  def initialize(filename = "posto.md")
    @filename = filename
  end

  def add(todo)
    @todos ||= []
    @todos << Todo.new(@todos.size + 1, todo)
  end

  def top(n = 1)
    top    = @todos.delete_at n - 1
    @todos = [top] + @todos
    renumber
  end

  def done(n = 1)
    @todos.delete_at n - 1
    renumber
  end

  def list
    @todos
  end

  def save
    IO.write(@filename, @todos.join("\n"))
  end

  private
  def renumber
    @todos.each_with_index do |todo, i|
      todo.renumber i + 1
    end
  end
end