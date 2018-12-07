class WordProblem # :nodoc:
  OPERATIONS = {
    'What is'       => :+,
    'plus'          => :+,
    'minus'         => :-,
    'multiplied by' => :*,
    'divided by'    => :/
  }.freeze

  def initialize(phrase)
    @phrase = phrase
  end

  def answer
    result = 0

    decoded_phrase.each do |command, value|
      raise ArgumentError unless OPERATIONS.key?(command)
      result = result.send(OPERATIONS[command], value.to_i)
    end

    result
  end

  private

  attr_reader :phrase

  def decoded_phrase
    operations = phrase.split(/([+|-]?\d+)/).map(&:strip)
    operations.pop if operations.last.eql?('?') # Removes the trailing "?"

    operations.each_slice(2)
  end
end
