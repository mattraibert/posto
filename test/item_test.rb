require 'test_helper'
require 'posto/item'

class ItemTest < MiniTest::Unit::TestCase
  def test_hide_markdown
    assert_equal "bottles", Posto::Item.new("99. bottles").hide_markdown
    assert_equal "unsorted item", Posto::Item.new("* unsorted item").hide_markdown
    assert_equal "funky * item with 99. junk", Posto::Item.new("* funky * item with 99. junk").hide_markdown
  end

  def test_compare_sorted_items
    assert_equal(1, Posto::Item.new("99. bottles").compare_sorted_items(Posto::Item.new("50. cents")))
    assert_equal(-1, Posto::Item.new("1. lonliest number").compare_sorted_items(Posto::Item.new("50. cents")))
    assert_equal(0, Posto::Item.new("1. lonliest number").compare_sorted_items(Posto::Item.new("1. The Only One")))
    assert_equal(nil, Posto::Item.new("* kleene").compare_sorted_items(Posto::Item.new("* twinkle twinkle")))
    assert_equal(nil, Posto::Item.new("* twinkle twinkle").compare_sorted_items(Posto::Item.new("1. The Only One")))
    assert_equal(nil, Posto::Item.new("99. bottles").compare_sorted_items(Posto::Item.new("* twinkle twinkle")))
  end

  def test_star
    assert_equal "* bottles", Posto::Item.new("99. bottles").star
    assert_equal "* fruit", Posto::Item.new("* fruit").star
  end

  def test_number
    assert_equal "99. bottles", Posto::Item.new("* bottles").number(99)
    assert_equal "99. cents", Posto::Item.new("50. cents").number(99)
  end
end