module Todo
  class Command
    attr_reader :block
    def initialize(path, block)
      @path = path
      @block = block
    end

    def name
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
