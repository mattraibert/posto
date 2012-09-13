require 'posto/todo'
require 'posto/monkeypatch_array'

module Posto
  class List
    class << self
      def number_todos(todos)
        todos.each_with_index.map { |todo, i| Todo.number(todo, i + 1) }
      end

      def choose_todo_lines(lines)
        lines.select { |line| Todo.todo?(line) }
      end

      def sort(todos)
        number_todos(todos.sort { |x, y| Todo.compare_sorted_todos(x, y) or Todo.ask_human_to_compare(x, y) })
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
    end
  end
end
