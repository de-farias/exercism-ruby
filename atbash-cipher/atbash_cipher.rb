class Atbash # :nodoc:
  NUMBERS               = ('0'..'9').to_a
  REGULAR_ALPHABET      = ('a'..'z').to_a
  REGULAR_WITH_NUMBERS  = REGULAR_ALPHABET + NUMBERS
  REVERSED_ALPHABET     = REGULAR_ALPHABET.reverse
  REVERSED_WITH_NUMBERS = REVERSED_ALPHABET + NUMBERS
  DICTIONARY            = Hash[REGULAR_WITH_NUMBERS.zip(REVERSED_WITH_NUMBERS)]

  def self.encode(text)
    crypted_chars = text.downcase.chars.map { |char| DICTIONARY[char] }.compact

    crypted_chars.each_slice(5)
                 .map(&:join)
                 .join(' ')
  end
end
