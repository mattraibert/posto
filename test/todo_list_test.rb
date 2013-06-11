require 'test_helper'
require 'posto/todo_list'

class TodoListTest < MiniTest::Unit::TestCase
  def setup
    `mkdir tmp` unless File.exist? "tmp"
    @my_todo_list = TodoList.new("tmp/posto.md")
    @my_todo_list.add("better do this")
  end

  def test_add
    @my_todo_list.add("and this")
    assert_includes(@my_todo_list.list, "* 1. better do this")
    assert_includes(@my_todo_list.list, "* 2. and this")
  end

  def test_done
    @my_todo_list.add("and this")
    @my_todo_list.done
    refute_includes(@my_todo_list.list, "* 1. better do this")
    assert_includes(@my_todo_list.list, "* 1. and this")
  end

  def test_done_with_a_param
    @my_todo_list.add("and this")
    @my_todo_list.done(2)
    refute_includes(@my_todo_list.list, "* 1. and this")
    assert_includes(@my_todo_list.list, "* 1. better do this")
  end

  def test_top
    @my_todo_list.add("and this")
    @my_todo_list.top(2)
    assert_equal(@my_todo_list.list, ["* 1. and this", "* 2. better do this"])
  end
  
  def test_save
    @my_todo_list.save

    assert_includes(IO.read("tmp/posto.md").lines, "* 1. better do this")
  end
end