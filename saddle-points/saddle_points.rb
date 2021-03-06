class Matrix
  attr_reader :rows

  def initialize(schema)
    to_integer_list = ->(list) { list.split.map(&:to_i) }

    @rows = schema.split("\n").map(&to_integer_list)
  end

  def columns
    rows.transpose
  end

  def saddle_points
    saddle_points = []

    elements_count.times do |idx|
      row_idx, col_idx = idx.divmod(rows[0].length)

      next unless largest_in_row?(rows[row_idx], col_idx) &&
                  smallest_in_column?(columns[col_idx], row_idx)

      saddle_points << [row_idx, col_idx]
    end

    saddle_points
  end

  private

  def elements_count
    rows.sum(&:length)
  end

  def largest_in_row?(row, idx)
    row[idx] == row.max
  end

  def smallest_in_column?(column, idx)
    column[idx] == column.min
  end
end
