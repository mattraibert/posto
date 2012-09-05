require 'posto/item'
require 'posto/monkeypatch_array'

module Posto
  class List
    class << self
      def number_items(items)
        items.each_with_index.map { |item, i| Item.number(item, i + 1) }
      end

      def choose_item_lines(lines)
        lines.select { |line| Item.item?(line) }
      end

      def sort(items)
        number_items(items.sort { |x, y| Item.compare_sorted_items(x, y) or Item.ask_human_to_compare(x, y) })
      end

      def starred_group(items)
        items.select { |item| Item.starred?(item) }
      end

      def numbered_group(items)
        sort items.select { |item| Item.numbered?(item) }
      end

      def done(items, n)
        unsort(items, n)[0..-2]
      end

      def unsort(items, n)
        numbered_group(items.reject_at(n - 1)) + starred_group(items.reject_at(n - 1)) + [Item.star(items[n - 1])]
      end

      def resort(items)
        sort items.map { |item| Item.star(item) }
      end

      def add(items, item)
        items + [Item.create(item)]
      end

      def quick(items, n)
        items[n -1] = Item.mark_quick(items[n - 1])
        items
      end
    end
  end
end
