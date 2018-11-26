class Nucleotide # :nodoc:
  NUCLEOTIDES = %w[A T C G].freeze

  class << self; alias from_dna new; end

  def initialize(dna)
    @dna = dna
  end

  def count(nucleotide)
    dna.chars.count { |char| char.eql?(nucleotide) }
  end

  def histogram
    {}.tap do |result|
      NUCLEOTIDES.each { |nucleotide| result[nucleotide] ||= count(nucleotide) }
    end
  end

  private

  attr_reader :dna
end