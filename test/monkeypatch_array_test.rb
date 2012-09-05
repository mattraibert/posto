require 'test_helper'
require 'posto/monkeypatch_array'

class MonkeypatchArrayTest < MiniTest::Unit::TestCase
  def test_reject_at_returns_a_modified_array_doesnt_modify_original
    rejected, modified = [1, 2, 3].freeze.reject_at(2)
    assert_equal([1, 2], modified)
    assert_equal(3, rejected)
  end

  def test_reject_at_returns_a_modified_array_doesnt_modify_original_with_accessors
    result = [1, 2, 3].freeze.reject_at(2)
    assert_equal([1, 2], result.remainder)
    assert_equal(3, result.rejected)
  end
end