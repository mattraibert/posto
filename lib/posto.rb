require 'highline/import'
require 'posto/arguments'
require 'posto/application'
require 'posto/file'
require 'posto/list'

module Posto
  class << self
    def main(args)
      arguments = Arguments.new(args)
      items = List.choose_item_lines(File.new(arguments.filename).lines)
      Application.new(arguments).run(items)
    end
  end
end