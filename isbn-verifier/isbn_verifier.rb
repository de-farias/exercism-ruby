class IsbnVerifier # :nodoc:
  def self.valid?(string)
    chars = reject_invalid_chars(string)

    return false if chars.length != 10

    chars[-1] = 10 if chars[-1] == 'X'

    (with_weights(chars).sum { |char, weight| char.to_i * weight } % 11).zero?
  end

  def self.reject_invalid_chars(string)
    string.chars.select { |c| c =~ /[0-9]|X/ }
  end

  def self.with_weights(chars)
    chars.zip((1..chars.length).to_a.reverse)
  end
end
