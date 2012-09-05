require 'test_helper'
require 'posto/list'

class ListTest < MiniTest::Unit::TestCase
  def test_replace_stars
    assert_equal(["1. this is one", "2. this is another", "3. card molly"],
                 Posto::List.new(["* this is one", "* this is another", "99. card molly"]).number_items)
  end

  def test_choose_item_lines
    assert_equal(["99. bottles", "* unsorted item"],
                 Posto::List.choose_item_lines(["TODO", "======", "99. bottles", "* unsorted item", "END", ""]))
  end

  def test_starred_group
    assert_equal(["* card molly", "* this is another"],
                 Posto::List.new(["* card molly", "* this is another", "1. this is one"]).starred_group)
  end

  def test_numbered_group
    assert_equal(["1. this is one"],
                 Posto::List.new(["* card molly", "* this is another", "1. this is one"]).numbered_group)
    assert_equal(["1. this is one", "2. card molly"],
                 Posto::List.new(["3. card molly", "* this is another", "1. this is one"]).numbered_group)
  end

  def test_unsort
    assert_equal(["1. this is another", "2. card molly", "* this is one"],
                 Posto::List.new(["1. this is one", "2. this is another", "3. card molly"]).unsort(1))
    assert_equal(["1. this is one", "2. this is another", "* card molly"],
                 Posto::List.new(["1. this is one", "2. this is another", "3. card molly"]).unsort(3))
    assert_equal(["1. this is one", "* card molly", "* this is another"],
                 Posto::List.new(["1. this is one", "2. this is another", "* card molly"]).unsort(2))
  end

  def test_done
    assert_equal(["1. this is another", "2. card molly"],
                 Posto::List.new(["1. this is one", "2. this is another", "3. card molly"]).done(1))
    assert_equal(["1. this is one", "2. this is another"],
                 Posto::List.new(["1. this is one", "2. this is another", "3. card molly"]).done(3))
    assert_equal(["1. this is one", "* card molly"],
                 Posto::List.new(["1. this is one", "2. this is another", "* card molly"]).done(2))
  end

  def test_quick
    assert_equal(["1. this is one (quick)", "2. this is another", "3. card molly"],
                 Posto::List.new(["1. this is one", "2. this is another", "3. card molly"]).quick(1))
    assert_equal(["1. this is one (quick)", "2. this is another", "3. card molly"],
                 Posto::List.new(["1. this is one (quick)", "2. this is another", "3. card molly"]).quick(1))
    assert_equal(["1. this is one", "2. this is another (quick)", "* card molly"],
                 Posto::List.new(["1. this is one", "2. this is another", "* card molly"]).quick(2))
  end

  def test_add
    assert_equal(["1. this is another", "2. card molly", "* this is one"],
                 Posto::List.new(["1. this is another", "2. card molly"]).add("* this is one"))
    assert_equal(["1. this is another", "2. card molly", "* this is one"],
                 Posto::List.new(["1. this is another", "2. card molly"]).add("this is one"))
  end
end