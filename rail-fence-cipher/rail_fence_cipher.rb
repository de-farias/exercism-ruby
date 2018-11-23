require_relative './rail_fence_cipher_encoder'

class RailFenceCipher
  def self.encode(text, rails_count)
    RailFenceCipherEncoder.new(text, rails_count).encode
  end
end
