require 'posto/item'

module Posto
  class List
    def initialize(items)
      @items = List.choose_item_lines(items)
    end

    def sort
      List.number_items(@items.sort { |x, y| Item.compare_sorted_items(x, y) or Item.ask_human_to_compare(x, y) })
    end

    def done(n)
      List.unsort(@items, n)[0..-2]
    end

    class << self
      def number_items(items)
        items.each_with_index.map { |item, i| Item.number(item, i + 1) }
      end

      def choose_item_lines(lines)
        lines.select { |line| Item.item?(line) }
      end

      def sort(items)
        List.new(items).sort
      end

      def starred_group(items)
        items.select { |item| Item.starred?(item) }
      end

      def numbered_group(items)
        sort items.select { |item| Item.numbered?(item) }
      end

      def done(items, n)
        List.new(items).done(n)
      end

      def unsort(items, n)
        item = items.delete_at(n - 1)
        numbered_group(items) + starred_group(items) + [Item.star(item)]
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
