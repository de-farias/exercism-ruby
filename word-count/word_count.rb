class Phrase
  attr_reader :phrase

  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words = phrase.downcase.scan(/\b[\w\']+\b/)
    words.group_by(&:itself).transform_values(&:count)
  end
end
