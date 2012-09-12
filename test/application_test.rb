require 'test_helper'
require 'posto/application'
require 'grasshopper'
require 'minitest/mock'

class ApplicationTest < MiniTest::Unit::TestCase
  def test_default
    application = application_with_mocks(Stub.like(:command => "list", :params => []))
    application.run(["funny list"])
    Mock.verify(application.io).puts(["funny list"])
  end

  def test_sort
    application = application_with_mocks(Stub.like(:command => "sort", :params => []))
    application.run([])
    Mock.verify(application.list_utility).sort([])
  end

  def test_resort
    application = application_with_mocks(Stub.like(:command => "resort", :params => []))
    application.run([])
    Mock.verify(application.list_utility).resort([])
  end

  def test_unsort
    application = application_with_mocks(Stub.like(:command => "unsort", :params => ["4"]))
    application.run([])
    Mock.verify(application.list_utility).unsort([], 4)
  end

  def test_done
    application = application_with_mocks(Stub.like(:command => "done", :params => ["4"]))
    application.run([])
    Mock.verify(application.list_utility).done([], 4)
  end

  def test_quick
    application = application_with_mocks(Stub.like(:command => "quick", :params => ["4"]))
    application.run([])
    Mock.verify(application.list_utility).quick([], 4)
  end

  def test_top
    application = application_with_mocks(Stub.like(:command => "top", :params => ["4"]))
    application.run([])
    Mock.verify(application.list_utility).top([], 4)
  end

  def test_add
    application = application_with_mocks(Stub.like(:command => "add", :params => ["a brand new item"]))
    application.run([])
    Mock.verify(application.list_utility).add([], "a brand new item")
  end

  private
  def application_with_mocks(arguments)
    application = Posto::Application.new(arguments)
    application.io = Mock.new
    application.file = Mock.new
    application.list_utility = Mock.new
    application
  end
end