class TodoList
  def initialize(filename = "posto.md")
    @filename = filename
  end

  def add(todo)
    @todos ||= []
    @todos << "* #{@todos.size + 1}. #{todo}"
  end
  
  def done(n = 0)
    @todos.delete_at n
    @todos.each_with_index {|todo, i| todo.gsub!(/.*?\./, "* #{i + 1}.")}
  end

  def list
    @todos
  end

  def save
    IO.write(@filename, @todos.join("\n"))
  end
end