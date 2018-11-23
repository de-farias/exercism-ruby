class Matrix
  def initialize(matrix_data)
    @matrix_data = matrix_data
  end

  def rows
    @matrix_data.each_line.map do |row|
      row.split.map(&:to_i)
    end
  end

  def columns
    rows.transpose
  end
end
