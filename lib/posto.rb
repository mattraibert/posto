require 'highline/import'
require 'posto/arguments'
require 'posto/application'
require 'posto/file'
require 'posto/list'

module Posto
  class << self
    def main(args)
      arguments = Arguments.new(args)
      file = File.new(arguments.filename)
      items = List.choose_item_lines(file.lines)
      result = Application.new(arguments).run(items)
      file.write(result)
    end
  end
end