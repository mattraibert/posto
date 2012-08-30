require 'test_helper'
require 'todo/path'

class CommandTest < MiniTest::Unit::TestCase
  def test_command
    assert_equal("doit", Todo::Path.new("doit").command)
    assert_equal("doit", Todo::Path.new("doit required_item").command)
    assert_equal("doit", Todo::Path.new("doit [item]").command)
    assert_equal("doit", Todo::Path.new("doit [item] -f filename").command)
  end

  def test_arguments
    assert_equal([], Todo::Path.new("doit").arguments)
    assert_equal(["required_item"], Todo::Path.new("doit required_item").arguments)
    assert_equal(["[item]", "required_item"], Todo::Path.new("doit [item] required_item").arguments)
    assert_equal(["required_item", "[item]"], Todo::Path.new("doit required_item [item]").arguments)
    assert_equal(["[item]"], Todo::Path.new("doit [item]").arguments)
    assert_equal(["[item]"], Todo::Path.new("doit [item] -f filename").arguments)
  end

  def test_flags
    assert_equal([], Todo::Path.new("doit").flags)
    assert_equal([], Todo::Path.new("doit required_item").flags)
    assert_equal([], Todo::Path.new("doit [item] required_item").flags)
    assert_equal([], Todo::Path.new("doit required_item [item]").flags)
    assert_equal([], Todo::Path.new("doit [item]").flags)
    assert_equal(["-f filename"], Todo::Path.new("doit [item] -f filename").flags)
  end
end