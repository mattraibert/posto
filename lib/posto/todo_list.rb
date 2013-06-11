class TodoList
  def initialize(filename = "posto.md")
    @filename = filename
  end

  def add(todo)
    @todos ||= []
    @todos << "* #{@todos.size + 1}. #{todo}"
  end
  
  def top(n = 1)
    top = @todos.delete_at n - 1
    @todos = [top] + @todos
    @todos.each_with_index {|todo, i| todo.gsub!(/.*?\./, "* #{i + 1}.")}
  end
  
  def done(n = 1)
    @todos.delete_at n - 1
    @todos.each_with_index {|todo, i| todo.gsub!(/.*?\./, "* #{i + 1}.")}
  end

  def list
    @todos
  end

  def save
    IO.write(@filename, @todos.join("\n"))
  end
end