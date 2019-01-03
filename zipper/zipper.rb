require 'forwardable'

class Zipper # :nodoc:
  attr_reader :focus

  def self.from_tree(tree)
    new(tree)
  end

  def initialize(tree)
    @tree  = tree
    @focus = tree

    tree.update_ancestry_line!
  end

  def to_tree
    @tree
  end

  def value
    @focus.value
  end

  def right
    @focus = @focus.right
    self
  end

  def left
    @focus = @focus.left
    self
  end

  def up
    @focus = @focus.up
    self
  end

  def value=(new_value)
    @focus.value = new_value
    self
  end
  alias set_value value=

  def left=(new_left)
    @focus.left = new_left
    self
  end
  alias set_left left=

  def right=(new_right)
    @focus.right = new_right
    self
  end
  alias set_right right=

  def ==(other)
    @focus == other.focus
  end

  def nil?
    focus.nil?
  end
end

class Node # :nodoc:
  attr_accessor :value, :up, :left, :right

  # rubocop:disable Naming/UncommunicativeMethodParamName
  def initialize(value, left, right, up = nil)
    @value = value
    @right = right
    @left  = left
    @up    = up
  end
  # rubocop:enable Naming/UncommunicativeMethodParamName

  def ==(other)
    %i[value right left].all? { |attr| send(attr) == other.send(attr) }
  end

  def update_ancestry_line!(parent = nil)
    @up = parent

    [left, right].each do |node|
      node.update_ancestry_line!(self) unless node.nil?
    end
  end
end
