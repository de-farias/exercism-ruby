class Triplet # :nodoc:
  def self.where(min_factor: 1, max_factor:, sum: :any)
    triplets = (min_factor..max_factor).to_a.combination(3).map do |sides|
      Triplet.new(*sides)
    end
    triplets.select!(&:pythagorean?)
    triplets.select! { |t| t.sum == sum } unless sum == :any

    triplets
  end

  def initialize(*sides)
    @sides = sides
  end

  def sum
    sides.sum
  end

  def product
    sides.inject(:*)
  end

  def pythagorean?
    a, b, c = sides
    a**2 + b**2 == c**2
  end

  private

  attr_reader :sides
end
