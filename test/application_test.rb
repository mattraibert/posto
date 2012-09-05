require 'test_helper'
require 'posto/application'
require 'grasshopper'
require 'minitest/mock'

class ApplicationTest < MiniTest::Unit::TestCase
  def test_default
    mock = Mock.new
    array = []
    result = Posto::Application.new(Stub.like(:command => "list", :params => []), mock).run(array)
    assert_same(array, result)
  end

  def test_sort
    mock = Mock.new
    Posto::Application.new(Stub.like(:command => "sort", :params => []), mock).run([])
    Mock.verify(mock).sort([])
  end

  def test_unsort
    mock = Mock.new
    Posto::Application.new(Stub.like(:command => "unsort", :params => ["4"]), mock).run([])
    Mock.verify(mock).unsort([], 4)
  end

  def test_resort
    mock = Mock.new
    Posto::Application.new(Stub.like(:command => "resort", :params => []), mock).run([])
    Mock.verify(mock).resort([])
  end

  def test_done
    mock = Mock.new
    Posto::Application.new(Stub.like(:command => "done", :params => ["4"]), mock).run([])
    Mock.verify(mock).done([], 4)
  end

  def test_add
    mock = Mock.new
    Posto::Application.new(Stub.like(:command => "add", :params => ["a brand new item"]), mock).run([])
    Mock.verify(mock).add([], "a brand new item")
  end

  def test_quick
    mock = Mock.new
    Posto::Application.new(Stub.like(:command => "quick", :params => ["4"]), mock).run([])
    Mock.verify(mock).quick([], 4)
  end
end