class Anagram
  def initialize(subject)
    @subject = subject
  end

  def match(possible_anagrams)
    possible_anagrams.select(&method(:anagram?))
  end

  private

  attr_reader :subject

  def anagram?(word)
    not_the_same?(word) && normalized(subject) == normalized(word)
  end

  def not_the_same?(word)
    !word.casecmp(subject).zero?
  end

  def normalized(word)
    word.downcase.chars.sort
  end
end
