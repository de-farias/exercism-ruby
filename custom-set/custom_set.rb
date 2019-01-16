class CustomSet
  attr_reader :items

  def initialize(items)
    @items = items.uniq
  end

  def add(item)
    items << item unless member?(item)
    self
  end

  def intersection(other)
    self.class.new(items & other.items)
  end

  def difference(other)
    self.class.new(items - other.items)
  end

  def union(other)
    self.class.new(items + other.items)
  end

  def empty?
    items.empty?
  end

  def member?(obj)
    items.include?(obj)
  end

  def subset?(other)
    items.all? { |item| other.member?(item) }
  end

  def disjoint?(other)
    items.none? { |item| other.member?(item) }
  end

  def ==(other)
    items.sort == other.items.sort
  end
end
