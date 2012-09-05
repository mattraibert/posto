require 'highline/import'
require 'posto/arguments'
require 'posto/application'
require 'posto/file'
require 'posto/list'

module Posto
  class << self
    def main(args)
      args = Arguments.new(args)
      file = File.new(args.filename)
      list = List.new(file.lines)

      result = Application.new(args, list).run.items

      file.write(result)
    end
  end
end