class Series # :nodoc:
  def initialize(string)
    @chars = string.chars
  end

  def largest_product(sequence_length)
    validate_input!(sequence_length)

    return 1 if chars.empty? || sequence_length.zero?

    chars.map(&:to_i)
         .each_cons(sequence_length)
         .map { |seq| seq.inject(:*) }
         .max
  end

  private

  attr_reader :chars

  def validate_input!(sequence_length)
    raise ArgumentError unless sequence_length.between?(0, chars.length) &&
                               chars.all? { |d| d =~ /\d/ }
  end
end
