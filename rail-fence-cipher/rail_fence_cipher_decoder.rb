require_relative './array_refinements'

class RailFenceCipherDecoder # :nodoc:
  using ArrayRefinements

  def initialize(rails_count)
    @rails_count = rails_count
  end

  def decode(text)
    fence     = text_on_rails(text)
    base_rail = fence.first
    fence.each { |rail| base_rail.merge(rail) }

    base_rail.join
  end

  private

  attr_reader :rails_count

  def text_on_rails(text)
    fence      = Array.new(rails_count) { [] }
    text_chars = text.chars

    fence.each_with_index do |rail, rail_idx|
      loop do
        rail_schema(rails_count).each do |schema_position|
          rail << (schema_position == rail_idx ? text_chars.shift : nil)

          break if text_chars.empty? || rail.length == text.length
        end

        break if text_chars.empty? || rail.length == text.length
      end
    end

    fence
  end

  def rail_schema(rails_count)
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
