module Todo
  module Util
    class << self
      MD_LIST_ITEM = /^(\*|\d+\.) /

      def number_items(items)
        items.each_with_index.map { |item, i| number(item, i + 1) }
      end

      def choose_item_lines(lines)
        lines.select { |line| MD_LIST_ITEM =~ line }
      end

      def hide_markdown(item)
        item.sub(MD_LIST_ITEM, "")
      end

      def sort(items)
        number_items(items.sort { |x, y| compare(x, y) })
      end

      def compare(x, y)
        compare_sorted_items(x, y) or ask_human_to_compare(x, y)
      end

      def ask_human_to_compare(x, y)
        while true do
          puts "1. #{hide_markdown x}"
          puts "2. #{hide_markdown y}"
          response = ask("which one is more important? (1, 2 or just hit enter if you don't care): ").to_i
          return 0 if response == 0
          return -1 if response == 1
          return 1 if response == 2
        end
      end

      def compare_sorted_items(x, y)
        x = x.to_i
        y = y.to_i
        return nil if (x == 0 or y == 0)
        return -1 if (y > x)
        return 1 if (x > y)
        0
      end

      def starred_group(items)
        items.select { |item| /^\* / =~ item }
      end

      def numbered_group(items)
        sort items.select { |item| /^\d+\. / =~ item }
      end

      def star(item)
        item.sub MD_LIST_ITEM, "* "
      end

      def number(item, n)
        item.sub MD_LIST_ITEM, "#{n}. "
      end

      def unsort(items, n)
        item = items.delete_at(n - 1)
        numbered_group(items) + starred_group(items) + [star(item)]
      end
    end
  end
end