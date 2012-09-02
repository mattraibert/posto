module Posto
  class Arguments
    def initialize(args)
      @args = args
    end

    def params
      @args[1..-1] || []
    end

    def command
      @args[0] || "sort"
    end

    def filename
      read_flag("-f") || "posto.md"
    end

    def read_flag(flag)
      filename_index = @args.index(flag)
      unless filename_index.nil?
        @args.delete_at(filename_index)
        @args.delete_at(filename_index)
      end
    end

    def to_s
      @args.inspect
    end
  end
end