require_relative 'board_validator'

class Board # :nodoc:
  BOARD_OFFSET = 1
  BOMB         = '*'.freeze

  def self.transform(input)
    new(input).transform
  end

  def initialize(rows)
    rows_chars = rows.map(&:chars)
    raise ArgumentError unless BoardValidator.new(rows_chars).valid?

    @rows = rows_chars
  end

  def transform
    rows[1...-1].each_with_index do |row, idx|
      row_idx = idx + BOARD_OFFSET

      row[1...-1].each_with_index do |_, inner_idx|
        col_idx = inner_idx + BOARD_OFFSET

        insert_bomb_count(row_idx, col_idx)
      end
    end

    rows.map(&:join)
  end

  private

  attr_reader :rows

  def insert_bomb_count(row, col)
    return if bomb?(row, col)

    bomb_count     = count_near_bombs(row, col)
    new_cell_value = bomb_count.zero? ? ' ' : bomb_count

    rows[row][col] = new_cell_value
  end

  def count_near_bombs(row, col)
    near_cells(row).product(near_cells(col)).count do |(row_idx, col_idx)|
      bomb?(row_idx, col_idx) &&
        !edge_row?(row_idx) &&
        !edge_column?(col_idx)
    end
  end

  def near_cells(idx)
    ((idx - 1)..(idx + 1)).to_a
  end

  def edge_row?(row)
    row.zero? || row == rows.length - 1
  end

  def edge_column?(col)
    col.zero? || col == rows[0].length - 1
  end

  def bomb?(row, col)
    rows[row][col] == BOMB
  end
end
