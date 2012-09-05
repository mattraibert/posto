require 'test_helper'
require 'posto/monkeypatch_array'

class MonkeypatchArrayTest < MiniTest::Unit::TestCase
  def test_reject_at_returns_a_modified_array_doesnt_modify_original
    remainder = [1, 2, 3].freeze.reject_at(2)
    assert_equal([1, 2], remainder)
  end
end