require 'test_helper'
require 'posto/application'
require 'grasshopper'

describe Posto::Application do
  describe "#list" do
    it "shows todo items" do
      args = Stub.like(:command => "list", :params => [])
      app = Posto::Application.new(args, ["* foo", "* bar"], :io => Mock.new)

      app.run

      Mock.verify(app.io).puts(["* foo", "* bar"])
    end
  end

  [:sort, :resort].each do |method|
    describe "##{method}" do
      it "calls #{method} on the list_utility given" do
        args = Stub.like(:command => method, :params => [])
        file = Mock.new
        list_utility = Mock.new

        app = Posto::Application.new(args, [], :file => file, :list_utility => list_utility, :io => Stub.new)
        app.run

        Mock.verify(list_utility).send(method, [])
        Mock.verify(file).write(nil)
      end
    end
  end

  [:unsort, :done, :delete, :do, :top, :quick].each do |method|
    describe "##{method}" do
      it "calls #{method} on the list_utility given" do
        args = Stub.like(:command => method, :params => ["4"])
        list_utility = Mock.new

        file = Mock.new
        app = Posto::Application.new(args, [], :list_utility => list_utility, :file => file, :io => Stub.new)
        app.run

        Mock.verify(list_utility).send(method, [], 4)
        Mock.verify(file).write(nil)
      end
    end
  end
end