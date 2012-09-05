require 'posto/item'
require 'posto/monkeypatch_array'

module Posto
  class List
    attr_reader :items

    def initialize(items)
      @items = List.choose_item_lines(items).map { |item| Item.new(item) }.freeze
    end

    ##commands
    def sort
      List.new(@items.sort { |x, y| Item.compare_sorted_items(x, y) or Item.ask_human_to_compare(x, y) }).number_items
    end

    def done(n)
      items = unsort(n).items
      List.new(items[0..-2])
    end

    def reject_at(n)
      o = @items.reject_at(n)
      [o.rejected, List.new(o.remainder)]
    end

    def unsort(n)
      item, remainder = reject_at(n - 1)
      remainder.numbered_group + remainder.starred_group + List.new([item.star])
    end

    def resort
      List.new(@items.map { |item| item.star }).sort
    end

    def add(item)
      List.new(@items + [Item.new(item).create])
    end

    def quick(n)
      items = @items.dup
      items[n -1] = items[n - 1].mark_quick
      List.new(items)
    end

    def number_items
      List.new(@items.each_with_index.map { |item, i| item.number(i + 1) })
    end

    def starred_group
      List.new(@items.select { |item| item.starred? })
    end

    def numbered_group
      List.new(@items.select { |item| item.numbered? }).sort
    end

    def +(list)
      List.new(items + list.items)
    end

    class << self
      def choose_item_lines(lines)
        lines.select { |line| Item.item?(line) }
      end
    end
  end
end
