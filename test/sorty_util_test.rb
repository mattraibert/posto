require 'test_helper'
require 'sorty_util'

class SortyUtilTest < MiniTest::Unit::TestCase
  def test_replace_stars
    assert_equal(["1. this is one", "2. this is another"],
                 replace_stars_with_ordinal_numbers(["* this is one", "* this is another"]))
  end
end