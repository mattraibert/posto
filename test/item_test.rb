require 'test_helper'
require 'todo/item'

class ItemTest < MiniTest::Unit::TestCase
  def test_hide_markdown
    assert_equal "bottles", Todo::Item.hide_markdown("99. bottles")
    assert_equal "unsorted item", Todo::Item.hide_markdown("* unsorted item")
    assert_equal "funky * item with 99. junk", Todo::Item.hide_markdown("* funky * item with 99. junk")
  end

  def test_compare_sorted_items
    assert_equal(1, Todo::Item.compare_sorted_items("99. bottles", "50. cents"))
    assert_equal(-1, Todo::Item.compare_sorted_items("1. lonliest number", "50. cents"))
    assert_equal(0, Todo::Item.compare_sorted_items("1. lonliest number", "1. The Only One"))
    assert_equal(nil, Todo::Item.compare_sorted_items("* kleene", "* twinkle twinkle"))
    assert_equal(nil, Todo::Item.compare_sorted_items("* twinkle twinkle", "1. The Only One"))
    assert_equal(nil, Todo::Item.compare_sorted_items("99. bottles", "* twinkle twinkle"))
  end

  def test_star
    assert_equal "* bottles", Todo::Item.star("99. bottles")
    assert_equal "* fruit", Todo::Item.star("* fruit")
  end

  def test_number
    assert_equal "99. bottles", Todo::Item.number("* bottles", 99)
    assert_equal "99. cents", Todo::Item.number("50. cents", 99)
  end
end