class SumOfMultiples
  def initialize(*values)
    @values = values
  end

  def to(limit)
    (1...limit).to_a.inject(0) do |acc, value|
      multiple?(value) ? acc + value : acc
    end
  end

  private

  attr_reader :values

  def multiple?(value)
    values.any? { |v| (value % v).zero? }
  end
end
