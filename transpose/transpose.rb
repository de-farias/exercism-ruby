class Transpose # :nodoc:
  def self.transpose(text)
    return text if text.empty?

    text_on_rails = normalized_text_rows(text)
    text_on_rails.transpose.map(&:join).map(&:rstrip).join("\n")
  end

  def self.normalized_text_rows(text)
    splitted_text = text.split("\n").map(&:chars)
    largest       = splitted_text.map(&:length).max

    splitted_text.map do |row|
      row.fill(' ', row.length, largest - row.length) if row.length < largest
      row
    end
  end
end
