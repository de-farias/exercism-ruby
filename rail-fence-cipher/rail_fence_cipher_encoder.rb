class RailFenceCipherEncoder # :nodoc:
  def initialize(rails_count)
    @rails_count = rails_count
  end

  def encode(text)
    text_on_rails(text).map { |rail| rail.compact.join }.join
  end

  private

  attr_reader :rails_count

  def text_on_rails(text)
    fence = Array.new(rails_count) { Array.new(text.length) }

    text.chars.each_with_index do |letter, idx|
      rail             = rail_for(idx)
      fence[rail][idx] = letter
    end

    fence
  end

  def rail_for(iteration)
    rail_schema[iteration % rail_schema.length]
  end

  def rail_schema
    @rail_schema ||= Array.new(2 * rails_count - 1).tap do |rail_schema|
      # Here we'll get the mirrored index, so for
      # a fence with 3 rails we'll end up with
      #
      # [0, nil, nil, nil, 0]
      # [0,  1,  nil,  1,  0]
      # [0,  1,   2 ,  1,  0]
      #
      rails_count.times do |idx|
        rail_schema[idx] = idx
        rail_schema[-1 - idx] = idx
      end

      # Now we remove the last item of the array, since
      # it will be the beginning of the next cycle.
      #
      # So, for the fence described above, we go from
      #
      # [0, 1, 2, 1, 0]
      #
      # to
      #
      # [0, 1, 2, 1]
      #
      rail_schema.pop if rail_schema.length > 1
    end
  end
end
