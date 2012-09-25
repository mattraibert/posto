require 'posto/todo'
require 'highline/import'

module Posto
  class HumanComparison
    def self.template(x, y)
      "\n================\n\n1. #{x}\n\n2. #{y}\n\n" +
          "which one is more important? (1, 2 or just hit enter if you don't care): "
    end

    def self.ask_human(x, y)
      while true do
        response = ask(template(Todo.hide_markdown(x), Todo.hide_markdown(y))).to_i
        return 0 if response == 0
        return -1 if response == 1
        return 1 if response == 2
      end
    end
  end
end