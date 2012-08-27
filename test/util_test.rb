require 'test_helper'
require 'todo/util'

class UtilTest < MiniTest::Unit::TestCase
  def test_replace_stars
    assert_equal(["1. this is one", "2. this is another", "3. card molly"],
                 Todo::Util.replace_stars_with_ordinal_numbers(["* this is one", "* this is another", "99. card molly"]))
  end

  def test_choose_item_lines
    assert_equal(["99. bottles", "* unsorted item"],
                 Todo::Util.choose_item_lines(["TODO", "======", "99. bottles", "* unsorted item", "END", ""]))
  end

  def test_hide_markdown
    assert_equal "bottles", Todo::Util.hide_markdown("99. bottles")
    assert_equal "unsorted item", Todo::Util.hide_markdown("* unsorted item")
    assert_equal "funky * item with 99. junk", Todo::Util.hide_markdown("* funky * item with 99. junk")
  end

  def test_compare_sorted_items
    assert_equal(1, Todo::Util.compare_sorted_items("99. bottles", "50. cents"))
    assert_equal(-1, Todo::Util.compare_sorted_items("1. lonliest number", "50. cents"))
    assert_equal(0, Todo::Util.compare_sorted_items("1. lonliest number", "1. The Only One"))
    assert_equal(nil, Todo::Util.compare_sorted_items("* kleene", "* twinkle twinkle"))
    assert_equal(nil, Todo::Util.compare_sorted_items("* twinkle twinkle", "1. The Only One"))
    assert_equal(nil, Todo::Util.compare_sorted_items("99. bottles", "* twinkle twinkle"))
  end

  def test_star
    assert_equal "* bottles", Todo::Util.star("99. bottles")
    assert_equal "* fruit", Todo::Util.star("* fruit")
  end

  def test_number
    assert_equal "99. bottles", Todo::Util.number("* bottles", 99)
    assert_equal "99. cents", Todo::Util.number("50. cents", 99)
  end

  def test_starred_group
    assert_equal(["* card molly", "* this is another"],
                 Todo::Util.starred_group(["* card molly", "* this is another", "1. this is one"]))
  end

  def test_numbered_group
    assert_equal(["1. this is one"],
                Todo::Util.numbered_group(["* card molly", "* this is another", "1. this is one"]))
  end

  def pending_test_unsort
    assert_equal(["* card molly", "1. this is one", "2. this is another"],
                 Todo::Util.unsort(["1. this is one", "2. this is another", "3. card molly"], 3))
    assert_equal(["* card molly", "* this is another", "1. this is one"],
                 Todo::Util.unsort(["1. this is one", "2. this is another", "* card molly"], 2))
  end
end