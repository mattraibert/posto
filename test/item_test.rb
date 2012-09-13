require 'test_helper'
require 'posto/item'

class TodoTest < MiniTest::Unit::TestCase
  def test_hide_markdown
    assert_equal "bottles", Posto::Todo.hide_markdown("99. bottles")
    assert_equal "unsorted todo", Posto::Todo.hide_markdown("* unsorted todo")
    assert_equal "funky * todo with 99. junk", Posto::Todo.hide_markdown("* funky * todo with 99. junk")
  end

  def test_compare_sorted_todos
    assert_equal(1, Posto::Todo.compare_sorted_todos("99. bottles", "50. cents"))
    assert_equal(-1, Posto::Todo.compare_sorted_todos("1. lonliest number", "50. cents"))
    assert_equal(0, Posto::Todo.compare_sorted_todos("1. lonliest number", "1. The Only One"))
    assert_equal(nil, Posto::Todo.compare_sorted_todos("* kleene", "* twinkle twinkle"))
    assert_equal(nil, Posto::Todo.compare_sorted_todos("* twinkle twinkle", "1. The Only One"))
    assert_equal(nil, Posto::Todo.compare_sorted_todos("99. bottles", "* twinkle twinkle"))
  end

  def test_star
    assert_equal "* bottles", Posto::Todo.star("99. bottles")
    assert_equal "* fruit", Posto::Todo.star("* fruit")
  end

  def test_number
    assert_equal "99. bottles", Posto::Todo.number("* bottles", 99)
    assert_equal "99. cents", Posto::Todo.number("50. cents", 99)
  end
end