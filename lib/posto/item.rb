require 'posto/template'

module Posto
  class Todo
    class << self
      MD_LIST_TODO = /^(\*|\d+\.) /

      def ask_human_to_compare(x, y)
        while true do
          response = ask(Template.human_comparison(hide_markdown(x), hide_markdown(y))).to_i
          return 0 if response == 0
          return -1 if response == 1
          return 1 if response == 2
        end
      end

      def compare_sorted_todos(x, y)
        x = x.to_i
        y = y.to_i
        return nil if (x == 0 or y == 0)
        x <=> y
      end

      def hide_markdown(todo)
        todo.sub(MD_LIST_TODO, "")
      end

      def star(todo)
        todo.sub MD_LIST_TODO, "* "
      end

      def number(todo, n)
        todo.sub MD_LIST_TODO, "#{n}. "
      end

      def todo?(line)
        MD_LIST_TODO =~ line
      end

      def create(todo)
        todo.sub(/^(\* )?/, "* ")
      end

      def mark_quick(todo)
        todo.sub(/( \(quick\))?$/, " (quick)")
      end

      def starred?(todo)
        /^\* / =~ todo
      end

      def numbered?(todo)
        /^\d+\. / =~ todo
      end
    end
  end
end