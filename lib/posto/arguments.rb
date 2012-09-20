module Posto
  class Arguments
    def initialize(args)
      @args = args
    end

    def params
      @args[1..-1] || []
    end

    def command
      @args[0] || "list"
    end

    def filename
      "posto.md"
    end
  end
end