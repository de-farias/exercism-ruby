class ResistorColorDuo
  COLORS_MAPPING = %w[
    black
    brown
    red
    orange
    yellow
    green
    blue
    violet
    grey
    white
  ]

  def self.value(input)
    input[0..1]
      .map { |color| COLORS_MAPPING.index(color) }
      .map(&:to_s)
      .join
      .to_i
  end

end
