require 'test_helper'
require 'posto/arguments'

class ArgumentsTest < MiniTest::Unit::TestCase
  def test_read_flag
    assert_equal("blah.md", Posto::Arguments.new(%w(-f blah.md)).read_flag("-f"))
    assert_equal("blah.md", Posto::Arguments.new(%w(sort -f blah.md)).read_flag("-f"))
    assert_equal("blah.md", Posto::Arguments.new(%w(done 5 -f blah.md)).read_flag("-f"))
    assert_equal("blah.md", Posto::Arguments.new(%w(-f blah.md done 5)).read_flag("-f"))
  end

  def test_command
    assert_equal("list", Posto::Arguments.new([]).command)
    assert_equal("sort", Posto::Arguments.new(%w(sort)).command)
    assert_equal("done", Posto::Arguments.new(%w(done 5)).command)
  end

  def test_params
    assert_equal([], Posto::Arguments.new([]).params)
    assert_equal([], Posto::Arguments.new(%w(sort)).params)
    assert_equal(["5"], Posto::Arguments.new(%w(done 5)).params)
  end

  def test_flag_deletes_flag
    args = %w(-f blah.md done 5)
    Posto::Arguments.new(args).read_flag("-f")
    assert_equal(%w(done 5), args)
  end
end