def replace_stars_with_ordinal_numbers (items)
  items.each_with_index.map { |x, i| x.sub /\*/, "#{i + 1}." }
end

def choose_item_lines(lines)
  lines.select { |line| /^(\*|\d+\.) / =~ line }
end
