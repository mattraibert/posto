require 'test_helper'
require 'posto/todo_list'

class TodoListTest < MiniTest::Unit::TestCase
  def test_add
    my_todo_list = TodoList.new
    my_todo_list.add("better do this")
    my_todo_list.add("and this")
    assert_includes(my_todo_list.list, "* 1. better do this")
    assert_includes(my_todo_list.list, "* 2. and this")
  end

  def test_save
    `mkdir tmp` unless File.exist? "tmp"
    my_todo_list = TodoList.new("tmp/posto.md")
    my_todo_list.add("better do this")
    my_todo_list.save

    assert_includes(IO.read("tmp/posto.md").lines, "* 1. better do this")
  end
end