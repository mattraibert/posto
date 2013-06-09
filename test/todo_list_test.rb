require 'test_helper'
require 'posto/todo_list'

class TodoListTest < MiniTest::Unit::TestCase
  def test_
    my_todo_list = TodoList.new
    my_todo_list.add("better do this")
    assert_includes(my_todo_list.list, "better do this")
  end
end