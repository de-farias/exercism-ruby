class Crypto
  def initialize(text)
    @text  = text.downcase.gsub(/\W/, '')
    @chars = @text.chars
  end

  def ciphertext
    return text unless chars.length > 1

    normalize_columns_and_rows!

    chunks = chars.each_slice(columns_count).to_a
    chunks.transpose.map(&:join).join(' ')
  end

  private

  attr_reader :text, :chars

  def normalize_columns_and_rows!
    chars << ' ' while chars.length != columns_count(reset: true) * rows_count
  end

  def columns_count(reset: false)
    @columns_count   = nil if reset
    @columns_count ||= Math.sqrt(text.length).ceil
  end

  def rows_count
    chars.length / columns_count
  end
end
