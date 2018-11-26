module ArrayRefinements # :nodoc:
  refine Array do
    def merge(other)
      other.each_with_index do |item, idx|
        self[idx] = item unless item.nil?
      end
    end
  end
end
