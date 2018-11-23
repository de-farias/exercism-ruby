class Hamming
  def self.compute(sequence_a, sequence_b)
    raise ArgumentError if sequence_a.length != sequence_b.length

    pairs = [sequence_a.chars, sequence_b.chars].transpose
    pairs.count { |first, second| first != second }
  end
end
