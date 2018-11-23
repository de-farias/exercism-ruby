class Raindrops
  def self.convert(number)
    new(number).convert
  end

  def initialize(number)
    @number = number
  end

  def convert
    sound  = ''
    sound += 'Pling' if divisible_by_3?
    sound += 'Plang' if divisible_by_5?
    sound += 'Plong' if divisible_by_7?

    sound.empty? ? number.to_s : sound
  end

  private

  attr_reader :number

  def divisible_by_3?
    (number % 3).zero?
  end

  def divisible_by_5?
    (number % 5).zero?
  end

  def divisible_by_7?
    (number % 7).zero?
  end
end
