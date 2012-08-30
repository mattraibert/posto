module Todo
  class Path
    def initialize(path)
      @path = path
    end

    def command
      @path.split(" ")[0]
    end

    def arguments
    end

    def optional_arguments
    end

    def flags
      @path.scan /-\w+ \w+/
    end
  end
end
