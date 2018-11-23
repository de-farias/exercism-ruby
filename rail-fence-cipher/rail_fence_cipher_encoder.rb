class RailFenceCipherEncoder # :nodoc:
  def initialize(text, rails_count)
    @rails_count = rails_count
    @text        = text
  end

  def encode
    text_on_rails.map { |rail| rail.compact.join }.join
  end

  private

  attr_reader :text, :rails_count

  def text_on_rails
    fence = Array.new(rails_count) { Array.new(text.length) }

    text.chars.each_with_index do |letter, idx|
      rail             = rail_for(idx)
      fence[rail][idx] = letter
    end

    fence
  end

  def rail_for(iteration)
    xablau = Array.new(2 * rails_count - 1)

    # Here we'll get the mirrored index, so for
    # a fence with 3 rails we'll end up with
    #
    # [0, nil, nil, nil, 0]
    # [0,  1,  nil,  1,  0]
    # [0,  1,   2 ,  1,  0]
    #
    rails_count.times do |idx|
      xablau[idx] = idx
      xablau[-1 - idx] = idx
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
    xablau.pop if xablau.length > 1

    xablau[iteration % xablau.length]
  end
end
