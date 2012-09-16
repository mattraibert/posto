module Posto
  class Todo
    class << self
      MD_LIST_TODO = /^(\*|\d+\.) /

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