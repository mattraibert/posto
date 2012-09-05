require 'posto/template'

module Posto
  class Item
    MD_LIST_ITEM = /^(\*|\d+\.) /

    attr_reader :item

    def initialize(item)
      @item = item.freeze
    end

    def ask_human_to_compare(other)
      while true do
        response = ask(Template.human_comparison(item.hide_markdown, other.hide_markdown)).to_i
        return 0 if response == 0
        return -1 if response == 1
        return 1 if response == 2
      end
    end

    def compare_sorted_items(y)
      x = item.to_i
      y = y.item.to_i
      return nil if (x == 0 or y == 0)
      x <=> y
    end

    def hide_markdown
      item.sub(MD_LIST_ITEM, "")
    end

    def star
      item.sub MD_LIST_ITEM, "* "
    end

    def number(n)
      item.sub MD_LIST_ITEM, "#{n}. "
    end

    def create
      item.sub(/^(\* )?/, "* ")
    end

    def mark_quick
      item.sub(/( \(quick\))?$/, " (quick)")
    end

    def starred?
      /^\* / =~ item
    end

    def numbered?
      /^\d+\. / =~ item
    end

    def item?
      MD_LIST_ITEM =~ item
    end

    class << self
      def item?(line)
        MD_LIST_ITEM =~ line
      end
    end
  end
end