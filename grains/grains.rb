class Grains
  TOTAL_TABLE_SQUARES = 64

  def self.square(number)
    raise ArgumentError unless number.between?(1, TOTAL_TABLE_SQUARES)

    2**(number - 1)
  end

  def self.total
    2**TOTAL_TABLE_SQUARES - 1
  end
end
