class Bst
  def initialize(value)
    @node = Node.new(value)
  end

  def each
    nodes_data = @node.to_a.flatten

    if block_given?
      nodes_data.each { |node_data| yield node_data }
    else
      nodes_data.to_enum
    end
  end

  def method_missing(method_name, *args, &block)
    if %i[data right left insert].include?(method_name)
      @node.send(method_name, *args, &block)
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    %i[data right left insert].include?(method_name) || super
  end
end

class Node
  attr_reader :data, :left, :right

  def initialize(value)
    @data = value
  end

  def insert(value)
    if value > data
      @right ? @right.insert(value) : @right = Node.new(value)
    else
      @left ? @left.insert(value) : @left = Node.new(value)
    end
  end

  def to_a
    left_data  = @left  ? left.to_a  : nil
    right_data = @right ? right.to_a : nil

    [left_data, data, right_data].compact
  end
end
