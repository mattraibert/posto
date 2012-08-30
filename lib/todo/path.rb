module Todo
  class Path
    def initialize(path)
      @path = path
    end

    def command
      @path.split(" ")[0]
    end

    def arguments
      @path.sub(/^\w+ ?/,"").gsub(/-\w+ \w+/,"").scan /\w+|\[\w+\]/
    end

    def flags
      @path.scan /-\w+ \w+/
    end
  end
end
