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
      result = Application.new(arguments, List.new(items)).run
      file.write(result)
    end
  end
end