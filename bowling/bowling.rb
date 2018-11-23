class Game
  MAXIMUM_ROLLS = 10
  TOTAL_PINS    = 10

  class BowlingError < StandardError; end

  def initialize
    @frames = [Frame.new]
  end

  def roll(pins)
    raise Game::BowlingError unless valid_frames.any?(&:still_compute_play?)

    frames.last(3).each { |roll| roll.compute_play(pins) }
    frames << Frame.new unless last_frame.throws_left?
  end

  def score
    raise Game::BowlingError if valid_frames.any?(&:still_compute_play?)

    valid_frames.sum(&:score)
  end

  private

  attr_reader :frames

  def valid_frames
    frames.first(MAXIMUM_ROLLS)
  end

  def maximum_rolls_played?
    frames.count == MAXIMUM_ROLLS
  end

  def last_frame
    frames.last
  end
end

class Frame
  def initialize
    @throws = []
  end

  def score
    throws.sum
  end

  def compute_play(pins)
    raise Game::BowlingError unless valid_throw?(pins)

    throws << pins if still_compute_play?
  end

  def throws_left?
    strike? ? throws.count < 1 : throws.count < 2
  end

  def still_compute_play?
    strike? || spare? ? throws.count < 3 : throws.count < 2
  end

  private

  attr_reader :throws

  def strike?
    throws[0] == Game::TOTAL_PINS
  end

  def spare?
    !strike? && throws[0..1].sum == Game::TOTAL_PINS
  end

  def valid_throw?(pins)
    valid_pins_count?(pins) && valid_pins_sum?(pins)
  end

  def valid_pins_count?(pins)
    pins.between?(0, Game::TOTAL_PINS)
  end

  def valid_pins_sum?(pins)
    return true if strike? || throws.count != 1
    throws[0].to_i + pins <= Game::TOTAL_PINS
  end
end
