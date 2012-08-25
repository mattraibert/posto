require 'test_helper'
require 'sorty/util'

class SortyUtilTest < MiniTest::Unit::TestCase
  def test_replace_stars
    assert_equal(["1. this is one", "2. this is another", "3. card molly"],
                 Sorty::Util.replace_stars_with_ordinal_numbers(["* this is one", "* this is another", "99. card molly"]))
  end

  def test_choose_item_lines
    assert_equal(["99. bottles", "* unsorted item"], 
                 Sorty::Util.choose_item_lines(["TODO", "======", "99. bottles", "* unsorted item", "END", ""]))
  end

  def test_hide_markdown
    assert_equal "bottles", Sorty::Util.hide_markdown("99. bottles")
    assert_equal "unsorted item", Sorty::Util.hide_markdown("* unsorted item")
    assert_equal "funky * item with 99. junk", Sorty::Util.hide_markdown("* funky * item with 99. junk")
  end

  def test_compare_sorted_items
    assert_equal(1, Sorty::Util.compare_sorted_items("99. bottles", "50. cents"))
    assert_equal(-1, Sorty::Util.compare_sorted_items("1. lonliest number", "50. cents"))
    assert_equal(0, Sorty::Util.compare_sorted_items("1. lonliest number", "1. The Only One"))
    assert_equal(nil, Sorty::Util.compare_sorted_items("* kleene", "* twinkle twinkle"))
    assert_equal(nil, Sorty::Util.compare_sorted_items("* twinkle twinkle", "1. The Only One"))
    assert_equal(nil, Sorty::Util.compare_sorted_items("99. bottles", "* twinkle twinkle"))
  end
end