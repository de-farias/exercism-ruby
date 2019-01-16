class BoardValidator # :nodoc:
  BOARD_HORIZONTAL_EDGE = '-'.freeze
  BOARD_VERTICAL_EDGE   = '|'.freeze
  BOARD_CORNER          = '+'.freeze
  BOMB                  = '*'.freeze

  def initialize(rows)
    @rows = rows
  end

  def valid?
    rows_with_same_length? && flawless_edges? && only_valid_chars?
  end

  private

  attr_reader :rows

  def rows_with_same_length?
    rows.each_cons(2).all? { |row1, row2| row1.length == row2.length }
  end

  def flawless_edges?
    flawless_horizontal_edges? && flawless_vertical_edges?
  end

  def flawless_horizontal_edges?
    [rows[0], rows[-1]].all? do |row|
      [row[0], row[-1]].all? { |cell| cell == BOARD_CORNER } &&
        row[1...-1].all? { |cell| cell == BOARD_HORIZONTAL_EDGE }
    end
  end

  def flawless_vertical_edges?
    rows[1...-1].all? do |row|
      [row[0], row[-1]].all? { |cell| cell == BOARD_VERTICAL_EDGE }
    end
  end

  def only_valid_chars?
    valid_chars = [
      BOARD_HORIZONTAL_EDGE,
      BOARD_VERTICAL_EDGE,
      BOARD_CORNER,
      BOMB,
      ' '
    ]

    rows.all? do |row|
      row.all? { |cell| valid_chars.include?(cell) }
    end
  end
end
