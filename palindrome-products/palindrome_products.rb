require 'ostruct'

class Palindromes
  attr_reader :largest, :smallest

  def initialize(min_factor: 1, max_factor:)
    @min_factor = min_factor
    @max_factor = max_factor
    @largest    = OpenStruct.new(value: -Float::INFINITY, factors: [])
    @smallest   = OpenStruct.new(value: Float::INFINITY, factors: [])
  end

  def generate
    min_factor.upto(max_factor) do |factor|
      factor.upto(max_factor) do |inner_factor|
        value = factor * inner_factor

        next unless palindrome?(value)

        compute_largest(value, factor, inner_factor)
        compute_smallest(value, factor, inner_factor)
      end
    end
  end

  private

  attr_reader :min_factor, :max_factor

  def palindrome?(value)
    chars = value.to_s.chars
    chars.join == chars.reverse.join
  end

  def compute_largest(value, *factors)
    return unless largest?(value)

    if value > largest.value
      largest.value   = value
      largest.factors = [factors]
    else
      largest.factors << factors
    end
  end

  def compute_smallest(value, *factors)
    return unless smallest?(value)

    if value < smallest.value
      smallest.value   = value
      smallest.factors = [factors]
    else
      smallest.factors << factors
    end
  end

  def largest?(value)
    value >= largest.value
  end

  def smallest?(value)
    value <= smallest.value
  end
end

# [
#   [
#     [3, 3],
#     [1, 9]
#   ], [
#     [1, 9],
#     [3, 3]
#   ]
# ]
