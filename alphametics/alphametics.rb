class Alphametics
  LE_NUMBERS = /(\b0\d+)/
  DIGITS     = (0..9).to_a

  def self.solve(puzzle)
    new(puzzle).solve
  end

  def initialize(puzzle)
    @puzzle            = puzzle.gsub!(/\s/, '')
    operation, result  = puzzle.split('==')
    @calculation_parts = operation.split('+') + [result]
  end

  def solve
    DIGITS.permutation(uniq_chars.length).each do |subject|
      values   = subject.join
      equation = tr(puzzle, values)
      equation.gsub!(LE_NUMBERS, $1[1..-1]) if equation.scan(LE_NUMBERS).any?

      return Hash[uniq_chars.chars.zip(subject)]  if eval(equation) && valid_result?(values)
    end

    {}
  end

  private

  attr_reader :puzzle, :calculation_parts

  def tr(string, values)
    string.tr(uniq_chars, values)
  end

  def uniq_chars
    @uniq_chars ||= puzzle.gsub(/\W/, '').chars.uniq.sort.join
  end

  def valid_result?(values)
    calculation_parts.none? { |operand| tr(operand, values)[0].to_i.zero? }
  end
end
