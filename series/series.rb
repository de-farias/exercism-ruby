class Series
  def initialize(digits)
    @digits = digits
  end

  def slices(chunk_size)
    raise ArgumentError unless within_limits?(chunk_size)

    digits.chars
          .each_cons(chunk_size)
          .map(&:join)
  end

  private

  attr_reader :digits

  def within_limits?(idx)
    idx <= digits.length
  end
end
