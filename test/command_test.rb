require 'test_helper'
require 'todo/command'

class CommandTest < MiniTest::Unit::TestCase
  def test_name
    assert_equal("doit", Todo::Command.new("doit").name)
    assert_equal("doit", Todo::Command.new("doit required_item").name)
    assert_equal("doit", Todo::Command.new("doit [item]").name)
    assert_equal("doit", Todo::Command.new("doit [item] -f filename").name)
  end

  def test_arguments
    assert_equal([], Todo::Command.new("doit").arguments)
    assert_equal(["required_item"], Todo::Command.new("doit required_item").arguments)
    assert_equal(["[item]", "required_item"], Todo::Command.new("doit [item] required_item").arguments)
    assert_equal(["required_item", "[item]"], Todo::Command.new("doit required_item [item]").arguments)
    assert_equal(["[item]"], Todo::Command.new("doit [item]").arguments)
    assert_equal(["[item]"], Todo::Command.new("doit [item] -f filename").arguments)
  end

  def test_flags
    assert_equal([], Todo::Command.new("doit").flags)
    assert_equal([], Todo::Command.new("doit required_item").flags)
    assert_equal([], Todo::Command.new("doit [item] required_item").flags)
    assert_equal([], Todo::Command.new("doit required_item [item]").flags)
    assert_equal([], Todo::Command.new("doit [item]").flags)
    assert_equal(["-f filename"], Todo::Command.new("doit [item] -f filename").flags)
  end
end