require 'test_helper'
require 'posto/arguments'

class ArgumentsTest < MiniTest::Unit::TestCase
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
end