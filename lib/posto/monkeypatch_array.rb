class Array
  alias :delete_at! :delete_at

  def reject_at(i)
    o = dup
    rejected = o.delete_at!(i)
    [rejected, o.freeze].tap do |result|
      def result.remainder
        last
      end

      def result.rejected
        first
      end
    end.freeze
  end
end
