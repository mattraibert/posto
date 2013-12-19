class Todo 
  include Comparable
  attr_accessor :todo, :n

  def initialize(n, todo)
    @todo = todo
    @n    = n
  end

  def renumber(n)
    @n = n
  end

  def to_s
    "* #{@n}. #{@todo}"
  end

  def <=>(o)
    n <=> o.n
  end
  
  def ==(o)
    n == o.n and todo == o.todo
  end
end