class Luhn
  def self.valid?(digits)
    new(digits).valid?
  end

  def initialize(digits)
    @digits = digits.delete(' ').chars
  end

  def valid?
    return false unless valid_length? && valid_digits?

    sum = digits.reverse
                .each_slice(2)
                .inject(0) do |acc, (first_digit, second_digit)|

      doubled  = second_digit.to_i * 2
      doubled -= 9 if doubled > 9

      acc + first_digit.to_i + doubled
    end

    sum.modulo(10).zero?
  end

  private

  attr_reader :digits

  def valid_length?
    digits.length > 1
  end

  def valid_digits?
    digits.all? { |digit| ('0'..'9').cover?(digit) }
  end
end
