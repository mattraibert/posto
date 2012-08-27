module Todo
  module Util
    class << self
      MD_LIST_ITEM = /^(\*|\d+\.) /

      def replace_stars_with_ordinal_numbers (items)
        items.each_with_index.map { |x, i| number(x, i + 1) }
      end

      def choose_item_lines(lines)
        lines.select { |line| MD_LIST_ITEM =~ line }
      end

      def hide_markdown(item)
        item.sub(MD_LIST_ITEM, "")
      end

      def sort(items)
        items.sort { |x, y| compare_sorted_items(x, y) or ask_human_to_compare(x, y) }
      end

      def ask_human_to_compare(x, y)
        while true do
          puts "1. #{hide_markdown x}"
          puts "2. #{hide_markdown y}"
          response = ask "which one is more important? (1, 2 or just hit enter if you don't care): "
          return 0 if response.to_i == 0
          return -1 if response.to_i == 1
          return 1 if response.to_i == 2
        end
      end

      def compare_sorted_items(item1, item2)
        item1 = item1.to_i
        item2 = item2.to_i
        return nil if (item1 == 0 or item2 == 0)
        return -1 if (item2 > item1)
        return 1 if (item1 > item2)
        0
      end

      def star(item)
        item.sub MD_LIST_ITEM, "* "
      end

      def number(item, n)
        item.sub MD_LIST_ITEM, "#{n}. "
      end

      def unsort(items, n)

      end
    end
  end
end