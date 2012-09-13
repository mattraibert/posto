require 'test_helper'
require 'posto/list'

class ListTest < MiniTest::Unit::TestCase
  def test_replace_stars
    assert_equal(["1. this is one", "2. this is another", "3. card molly"],
                 Posto::List.number_todos(["* this is one", "* this is another", "99. card molly"]))
  end

  def test_choose_todo_lines
    assert_equal(["99. bottles", "* unsorted todo"],
                 Posto::List.choose_todo_lines(["TODO", "======", "99. bottles", "* unsorted todo", "END", ""]))
  end

  def test_starred_group
    assert_equal(["* card molly", "* this is another"],
                 Posto::List.starred_group(["* card molly", "* this is another", "1. this is one"]))
  end

  def test_numbered_group
    assert_equal(["1. this is one"],
                 Posto::List.numbered_group(["* card molly", "* this is another", "1. this is one"]))
    assert_equal(["1. this is one", "2. card molly"],
                 Posto::List.numbered_group(["3. card molly", "* this is another", "1. this is one"]))
  end

  def test_unsort
    assert_equal(["1. this is another", "2. card molly", "* this is one"],
                 Posto::List.unsort(["1. this is one", "2. this is another", "3. card molly"], 1))
    assert_equal(["1. this is one", "2. this is another", "* card molly"],
                 Posto::List.unsort(["1. this is one", "2. this is another", "3. card molly"], 3))
    assert_equal(["1. this is one", "* card molly", "* this is another"],
                 Posto::List.unsort(["1. this is one", "2. this is another", "* card molly"], 2))
  end

  def test_done
    assert_equal(["1. this is another", "2. card molly"],
                 Posto::List.done(["1. this is one", "2. this is another", "3. card molly"], 1))
    assert_equal(["1. this is one", "2. this is another"],
                 Posto::List.done(["1. this is one", "2. this is another", "3. card molly"], 3))
    assert_equal(["1. this is one", "* card molly"],
                 Posto::List.done(["1. this is one", "2. this is another", "* card molly"], 2))
  end

  def test_quick
    assert_equal(["1. this is one (quick)", "2. this is another", "3. card molly"],
                 Posto::List.quick(["1. this is one", "2. this is another", "3. card molly"], 1))
    assert_equal(["1. this is one (quick)", "2. this is another", "3. card molly"],
                 Posto::List.quick(["1. this is one (quick)", "2. this is another", "3. card molly"], 1))
    assert_equal(["1. this is one", "2. this is another (quick)", "* card molly"],
                 Posto::List.quick(["1. this is one", "2. this is another", "* card molly"], 2))
  end

  def test_add
    assert_equal(["1. this is another", "2. card molly", "* this is one"],
                 Posto::List.add(["1. this is another", "2. card molly"], "* this is one"))
    assert_equal(["1. this is another", "2. card molly", "* this is one"],
                 Posto::List.add(["1. this is another", "2. card molly"], "this is one"))
  end

  def test_top
    assert_equal(["1. card molly", "2. this is one", "3. this is another",],
                 Posto::List.top(["1. this is one", "2. this is another", "3. card molly"], 3))
    assert_equal(["1. this is another", "2. this is one", "3. card molly"],
                 Posto::List.top(["1. this is one", "2. this is another", "3. card molly"], 2))
    assert_equal(["1. this is another", "2. this is one", "* card molly"],
                 Posto::List.top(["1. this is one", "2. this is another", "* card molly"], 2))
  end
end