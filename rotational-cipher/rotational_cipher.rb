class RotationalCipher # :nodoc:
  ALPHABET = ('a'..'z')

  def self.rotate(letters, rotations)
    rotated_letters = letters.chars.map do |letter|
      if ALPHABET.include?(letter.downcase)
        rotations.times { letter = letter.next[0] }
      end

      letter
    end

    rotated_letters.join
  end
end
