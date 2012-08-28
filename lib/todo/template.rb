module Todo
  module Template
    def self.todo_list(items)
      "todo\n----\n\n#{items.join("\n")}\n"
    end
  end
end
