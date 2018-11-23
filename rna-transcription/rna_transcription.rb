class Complement
  DNA = 'GCTA'.freeze
  RNA = 'CGAU'.freeze

  def self.of_dna(strand)
    strand.tr(DNA, RNA)
  end
end
