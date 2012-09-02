require 'posto/template'

module Posto
  class Item
    class << self
      MD_LIST_ITEM = /^(\*|\d+\.) /

      def ask_human_to_compare(x, y)
        while true do
          response = ask(Template.human_comparison(hide_markdown(x), hide_markdown(y))).to_i
          return 0 if response == 0
          return -1 if response == 1
          return 1 if response == 2
        end
      end

      def compare_sorted_items(x, y)
        x = x.to_i
        y = y.to_i
        return nil if (x == 0 or y == 0)
        x <=> y
      end

      def hide_markdown(item)
        item.sub(MD_LIST_ITEM, "")
      end

      def star(item)
        item.sub MD_LIST_ITEM, "* "
      end

      def number(item, n)
        item.sub MD_LIST_ITEM, "#{n}. "
      end

      def item?(line)
        MD_LIST_ITEM =~ line
      end
    end
  end
end