class Cipher # :nodoc:
  ALPHABET = ('a'..'z').to_a

  attr_reader :key

  def initialize(key = random_key)
    validate_key!(key)

    @key = key
  end

  def encode(text)
    transform_text(text)
  end

  def decode(text)
    transform_text(text, reverse: true)
  end

  private

  def transform_text(text, reverse: false)
    transformed = text.chars.each_with_index.map do |char, idx|
      rotations  = ALPHABET.index(key[idx])
      rotations *= -1 if reverse

      char.tr(ALPHABET.join, ALPHABET.rotate(rotations).join)
    end

    transformed.join
  end

  def validate_key!(key)
    raise ArgumentError if key.empty? || key !~ /\A[a-z]+\z/
  end

  def random_key
    ('a'..'z').to_a.sample(100).join
  end
end
