require 'test_helper'
require 'posto/todo'

class TodoTest < MiniTest::Unit::TestCase
  def test_comparisons
    one   = Todo.new(1, "one thing")
    two   = Todo.new(2, "blue thing")
    three = Todo.new(3, "fish thing")
    assert_equal([one, two, three], [two, three, one].sort)
  end

  # there shouldn't be a number on to todo. It's number is a property of hte list.
  # there should be two lists: sorted and unsorted
  # each todo should be stored as a file (a folder?); maybe rename to story?
  # todos can have checklists/tasks 
  # need to be able to push a todo to the bottom of the sorted list

end