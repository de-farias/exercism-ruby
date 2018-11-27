class Queens
  def initialize(setup)
    @white_queen = Queen.new(setup[:white]) if setup[:white]
    @black_queen = Queen.new(setup[:black]) if setup[:black]
  end

  def attack?
    @white_queen.attack?(@black_queen)
  end
end

class Queen
  attr_reader :axis_x, :axis_y

  def initialize(position)
    @axis_x = position[0]
    @axis_y = position[1]

    raise ArgumentError unless valid_position?
  end

  def attack?(other)
    same_line?(other) || same_column?(other) || diagonal?(other)
  end

  private

  def same_line?(other)
    axis_x.eql?(other.axis_x)
  end

  def same_column?(other)
    axis_y.eql?(other.axis_y)
  end

  def diagonal?(other)
    (axis_x - other.axis_x).abs.eql?((axis_y - other.axis_y).abs)
  end

  def valid_position?
    [axis_x, axis_y].all? { |axis| axis.between?(0, 7) }
  end
end
