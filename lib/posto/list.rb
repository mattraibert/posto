require 'posto/todo'
require 'posto/monkeypatch_array'
require 'posto/human_comparison'

module Posto
  class List
    class << self
      def number_todos(todos)
        todos.each_with_index.map { |todo, i| Posto::Todo.number(todo, i + 1) }
      end

      def choose_todo_lines(lines)
        todos, backlog = lines.slice_before(/^backlog$/).to_a
        todos.select { |todo| Todo.todo?(todo) }
      end

      def sort(todos)
        number_todos(todos.sort { |x, y| Todo.compare_sorted_todos(x, y) or HumanComparison.ask_human(x, y) })
      end

      def starred_group(todos)
        todos.select { |todo| Todo.starred?(todo) }
      end

      def numbered_group(todos)
        sort todos.select { |todo| Todo.numbered?(todo) }
      end

      def done(todos, n)
        unsort(todos, n)[0..-2]
      end
      alias :delete :done

      def unsort(todos, n)
        numbered_group(todos.reject_at(n - 1)) + starred_group(todos.reject_at(n - 1)) + [Todo.star(todos[n - 1])]
      end

      def resort(todos)
        sort todos.map { |todo| Todo.star(todo) }
      end

      def add(todos, todo)
        todos + [Todo.create(todo)]
      end

      def quick(todos, n)
        todos[n -1] = Todo.mark_quick(todos[n - 1])
        todos
      end

      def top(todos, n)
        starred_group = starred_group(todos.reject_at(n - 1))
        numbered_group = numbered_group(todos.reject_at(n - 1))
        array = [todos[n - 1]]
        number_todos(array + numbered_group) + starred_group
      end
      alias :do :top

      def lookup(todos, n)
        Posto::Todo.hide_markdown(todos[n.to_i - 1])
      end
    end
  end
end
