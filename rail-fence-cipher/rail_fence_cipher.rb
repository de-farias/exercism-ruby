require_relative './rail_fence_cipher_encoder'
require_relative './rail_fence_cipher_decoder'

class RailFenceCipher # :nodoc:
  def self.encode(text, rails_count)
    RailFenceCipherEncoder.new(rails_count).encode(text)
  end

  def self.decode(text, rails_count)
    RailFenceCipherDecoder.new(rails_count).decode(text)
  end
end
