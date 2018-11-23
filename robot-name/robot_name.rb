class Robot
  attr_reader :name

  def self.possible_names(reset: false)
    @possible_names   = nil if reset
    @possible_names ||= ('AA000'..'ZZ999').to_a.shuffle
  end

  def self.forget
    possible_names(reset: true)
  end

  def initialize
    reset
  end

  def reset
    @name = possible_names.pop
  end

  def possible_names
    self.class.possible_names
  end
end
