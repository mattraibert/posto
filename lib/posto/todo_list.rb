class TodoList
  def add(todo)
    @todos ||= []
    @todos << "* #{@todos.size + 1}. #{todo}"
  end

  def list
    @todos
  end
end