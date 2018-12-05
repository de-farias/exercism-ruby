module ArrayRefinements # :nodoc:
  refine Array do
    def diff(other)
      dup.tap do |copy|
        other.each do |el|
          copy.slice!(copy.index(el)) if copy.include?(el)
        end
      end
    end
  end
end

class Triangle # :nodoc:
  using ArrayRefinements

  def initialize(sides)
    @sides = sides
  end

  def equilateral?
    valid_sides? &&
      side_pairs.all? { |side1, side2| side1 == side2 }
  end

  def isosceles?
    valid_sides? &&
      side_pairs.any? { |side1, side2| side1 == side2 }
  end

  def scalene?
    valid_sides? &&
      side_pairs.none? { |side1, side2| side1 == side2 }
  end

  private

  attr_reader :sides

  def valid_sides?
    triangle_shape? && !sides.all?(&:zero?)
  end

  def triangle_shape?
    side_pairs.all? do |side_pair|
      # How long, how looooooong can I slide?
      other_side = sides.diff(side_pair)[0]

      side_pair.sum >= other_side
    end
  end

  def side_pairs
    @side_pairs ||= sides.combination(2)
  end
end
