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

def compare_sorted_items(item1, item2)
  item1 = item1.to_i
  item2 = item2.to_i
  return nil if(item1 == 0 or item2 == 0)
  return -1 if(item2 > item1)
  return 1 if(item1 > item2)
  0
end
