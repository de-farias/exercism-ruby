class SimpleLinkedList # :nodoc:
  def initialize(values = [])
    @length = 0
    values.each { |value| push(Element.new(value)) }
  end

  def push(element)
    if empty?
      @root = element
    else
      target = nth_element(-1)
      target.next = element
    end

    @length += 1
    self
  end

  def pop
    return nil if empty?

    if many?
      target = nth_element(-1)
      nth_element(-2).next = nil
    else
      target = root
      @root  = nil
    end

    @length -= 1
    target
  end

  def reverse!
    values = to_a
    empty_list!

    values.each { |value| push(Element.new(value)) }

    self
  end

  def to_a
    [].tap do |array|
      until empty?
        current_node = pop
        array << current_node.datum
      end
    end
  end

  private

  attr_reader :length, :root

  def nth_element(idx)
    return nth_element(length + idx) if idx < 0

    current = root
    idx.times { current = current.next }

    current
  end

  def many?
    length > 1
  end

  def empty?
    length.zero?
  end

  def empty_list!
    @root   = nil
    @length = 0
  end
end

class Element # :nodoc:
  attr_accessor :next
  attr_reader :datum

  def initialize(datum)
    @datum = datum
  end

  def ==(other)
    datum == other.datum
  end
end
