class Pangram
  def self.pangram?(sentence)
    sentence_chars = sentence.downcase.chars
    unused_chars   = ('a'..'z').to_a - sentence_chars

    unused_chars.empty?
  end
end
