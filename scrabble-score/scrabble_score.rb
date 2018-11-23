require 'ostruct'

class Scrabble
  SCORE = {
    %w[a e i o u l n r s t] => 1,
    %w[d g]                 => 2,
    %w[b c m p]             => 3,
    %w[f h v w y]           => 4,
    %w[k]                   => 5,
    %w[j x]                 => 8,
    %w[q z]                 => 10
  }.freeze

  def self.score(word)
    new(word).score
  end

  def initialize(word)
    @chars = (word.to_s.scan(/\w+/)[0] || '').downcase.chars
  end

  def score
    chars.sum { |char| tuple_for(char).value }
  end

  private

  attr_reader :chars

  def tuple_for(char)
    tuple = SCORE.select { |group, _| group.include?(char) }.first
    OpenStruct.new(keys: tuple[0], value: tuple[1])
  end
end
