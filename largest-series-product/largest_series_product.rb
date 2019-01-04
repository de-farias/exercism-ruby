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
    invalid_input = sequence_length > chars.length ||
                    sequence_length < 0 ||
                    chars.any? { |d| d =~ /\D/ }

    raise ArgumentError if invalid_input
  end
end
