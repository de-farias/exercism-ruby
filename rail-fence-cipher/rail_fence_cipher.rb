class RailFenceCipher
  def self.encode(text, rails)
    return text if rails == 1

    railed_text(text, rails).join
  end

  def self.decode(text, rails)
    return text if rails == 1

    placeholder = railed_text(Array.new(text.length) { ' ' }.join, rails)

    placeholder_idx = 0
    char_idx = 0

    text.each_char do |char|
      if char_idx >= placeholder[placeholder_idx].length
        placeholder_idx += 1
        char_idx = 0
      end

      placeholder[placeholder_idx][char_idx] = char
      char_idx += 1
    end

    p placeholder

    placeholder.transpose.join
  end

  def self.railed_text(text, rails)
    result = Array.new(rails) { [] }

    text.chars.each_with_index do |char, idx|
      xablau = (rails - 1) * 2
      coiso  = case
               when (idx % xablau).zero? then 0
               else
                 shazam  = idx
                 shazam -= xablau while shazam >= rails
                 shazam.abs
               end

      result[coiso] << char
    end

    result
  end

  def self.index_for(idx)
    idx % rails
  end
end
