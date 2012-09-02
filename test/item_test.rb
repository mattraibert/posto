require 'test_helper'
require 'posto/item'

class ItemTest < MiniTest::Unit::TestCase
  def test_hide_markdown
    assert_equal "bottles", Posto::Item.hide_markdown("99. bottles")
    assert_equal "unsorted item", Posto::Item.hide_markdown("* unsorted item")
    assert_equal "funky * item with 99. junk", Posto::Item.hide_markdown("* funky * item with 99. junk")
  end

  def test_compare_sorted_items
    assert_equal(1, Posto::Item.compare_sorted_items("99. bottles", "50. cents"))
    assert_equal(-1, Posto::Item.compare_sorted_items("1. lonliest number", "50. cents"))
    assert_equal(0, Posto::Item.compare_sorted_items("1. lonliest number", "1. The Only One"))
    assert_equal(nil, Posto::Item.compare_sorted_items("* kleene", "* twinkle twinkle"))
    assert_equal(nil, Posto::Item.compare_sorted_items("* twinkle twinkle", "1. The Only One"))
    assert_equal(nil, Posto::Item.compare_sorted_items("99. bottles", "* twinkle twinkle"))
  end

  def test_star
    assert_equal "* bottles", Posto::Item.star("99. bottles")
    assert_equal "* fruit", Posto::Item.star("* fruit")
  end

  def test_number
    assert_equal "99. bottles", Posto::Item.number("* bottles", 99)
    assert_equal "99. cents", Posto::Item.number("50. cents", 99)
  end
end