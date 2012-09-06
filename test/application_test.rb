require 'test_helper'
require 'posto/application'
require 'grasshopper'
require 'minitest/mock'

class ApplicationTest < MiniTest::Unit::TestCase
  def test_default
    array = []
    result = Posto::Application.new(Stub.like(:command => "list", :params => []), Mock.new, Mock.new).run(array)
    assert_same(array, result)
  end

  def test_sort
    mock = Mock.new
    Posto::Application.new(Stub.like(:command => "sort", :params => []), mock, Mock.new).run([])
    Mock.verify(mock).sort([])
  end

  def test_unsort
    mock = Mock.new
    Posto::Application.new(Stub.like(:command => "unsort", :params => ["4"]), mock, Mock.new).run([])
    Mock.verify(mock).unsort([], 4)
  end

  def test_resort
    mock = Mock.new
    Posto::Application.new(Stub.like(:command => "resort", :params => []), mock, Mock.new).run([])
    Mock.verify(mock).resort([])
  end

  def test_done
    mock = Mock.new
    Posto::Application.new(Stub.like(:command => "done", :params => ["4"]), mock, Mock.new).run([])
    Mock.verify(mock).done([], 4)
  end

  def test_add
    mock = Mock.new
    Posto::Application.new(Stub.like(:command => "add", :params => ["a brand new item"]), mock, Mock.new).run([])
    Mock.verify(mock).add([], "a brand new item")
  end

  def test_quick
    mock = Mock.new
    Posto::Application.new(Stub.like(:command => "quick", :params => ["4"]), mock, Mock.new).run([])
    Mock.verify(mock).quick([], 4)
  end

  def test_top
    mock = Mock.new
    Posto::Application.new(Stub.like(:command => "top", :params => ["4"]), mock, Mock.new).run([])
    Mock.verify(mock).top([], 4)
  end
end