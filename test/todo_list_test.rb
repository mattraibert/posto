require 'test_helper'
require 'posto/todo_list'

class TodoListTest < MiniTest::Unit::TestCase
  def test_this
    my_todo_list = TodoList.new
    my_todo_list.add("better do this")
    my_todo_list.add("and this")
    assert_includes(my_todo_list.list, "* 1. better do this")
    assert_includes(my_todo_list.list, "* 2. and this")
  end
end