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
      unsort(n)[0..-2]
    end

    def unsort(n)
      item = @items.delete_at(n - 1)
      List.numbered_group(@items) + List.starred_group(@items) + [Item.star(item)]
    end

    def resort
      @items = @items.map { |item| Item.star(item) }
      sort #TODO two different abstraction levels
    end

    def add(item)
      @items + [Item.create(item)]
    end

    def quick(n)
      @items[n -1] = Item.mark_quick(@items[n - 1])
      @items
    end

    class << self
      def number_items(items)
        items.each_with_index.map { |item, i| Item.number(item, i + 1) }
      end

      def choose_item_lines(lines)
        lines.select { |line| Item.item?(line) }
      end

      def starred_group(items)
        items.select { |item| Item.starred?(item) }
      end

      def numbered_group(items)
        List.new(items.select { |item| Item.numbered?(item) }).sort
      end
    end
  end
end
