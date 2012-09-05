class Array
  alias :delete_at! :delete_at

  def reject_at(i)
    dup.tap {|array| array.delete_at(i)}.freeze
  end
end
