class Array
  def accumulate
    each_with_object([]) do |el, pool|
      pool << yield(el)
    end
  end
end
