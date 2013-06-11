class TodoList
  def initialize(filename = "posto.md")
    @filename = filename
  end

  def add(todo)
    @todos ||= []
    @todos << "* #{@todos.size + 1}. #{todo}"
  end

  def list
    @todos
  end

  def save
    IO.write(@filename, @todos.join("\n"))
  end
end