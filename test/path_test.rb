require 'test_helper'
require 'todo/path'

class PathTest < MiniTest::Unit::TestCase
  def test_command
    assert_equal("doit", Todo::Path.new("doit").command)
    assert_equal("doit", Todo::Path.new("doit required_item").command)
    assert_equal("doit", Todo::Path.new("doit [item]").command)
    assert_equal("doit", Todo::Path.new("doit [item] -f filename").command)
  end

  def pending_test_required_arguments
    assert_equal([], Todo::Path.new("doit").arguments)
    assert_equal(["required_item"], Todo::Path.new("doit required_item").arguments)
    assert_equal(["required_item"], Todo::Path.new("doit [item] required_item").arguments)
    assert_equal(["required_item"], Todo::Path.new("doit required_item [item]").arguments)
    assert_equal([], Todo::Path.new("doit [item]").arguments)
    assert_equal([], Todo::Path.new("doit [item] -f filename").arguments)
  end

  def pending_test_optional_arguments
    assert_equal([], Todo::Path.new("doit").optional_arguments)
    assert_equal([], Todo::Path.new("doit required_item").optional_arguments)
    assert_equal(["item"], Todo::Path.new("doit [item] required_item").optional_arguments)
    assert_equal(["item"], Todo::Path.new("doit required_item [item]").optional_arguments)
    assert_equal(["item"], Todo::Path.new("doit [item]").optional_arguments)
    assert_equal(["item"], Todo::Path.new("doit [item] -f filename").optional_arguments)
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