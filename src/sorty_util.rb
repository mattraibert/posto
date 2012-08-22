MD_LIST_ITEM = /^(\*|\d+\.) /

def replace_stars_with_ordinal_numbers (items)
  items.each_with_index.map { |x, i| x.sub MD_LIST_ITEM, "#{i + 1}. " }
end


def choose_item_lines(lines)
  lines.select { |line| MD_LIST_ITEM =~ line }
end

def hide_markdown(item)
  item.sub(MD_LIST_ITEM, "")
end
