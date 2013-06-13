class Todo
  attr_accessor :todo, :i

  def initialize(i, todo)
    @todo = todo
    @i    = i
  end

  def renumber(i)
    @i = i
  end

  def to_s
    "* #{@i}. #{@todo}"
  end

  def ==(o)
    i == o.i and todo == o.todo
  end
end