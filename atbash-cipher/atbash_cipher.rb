class Atbash # :nodoc:
  REGULAR_ALPHABET      = Array('a'..'z').join
  REVERSED_ALPHABET     = REGULAR_ALPHABET.reverse

  def self.encode(text)
    cleansed_text = text.downcase.delete('^a-z0-9')
    cleansed_text.tr(REGULAR_ALPHABET, REVERSED_ALPHABET)
                 .scan(/\w{1,5}/)
                 .join(' ')
  end
end
