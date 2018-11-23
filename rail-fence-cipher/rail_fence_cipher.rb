class RailFenceCipher
  def self.encode(text, rails_count)
    return text if rails_count == 1

    fence         = Array.new(rails_count) { Array.new(text.length) }
    text_on_rails = distribute_letters(text.chars, fence)

    text_on_rails.map { |rail| rail.compact.join }.join
  end

  def self.distribute_letters(letters, fence)
    letters.each_with_index do |letter, idx|
      rail = proper_rail(fence.length, idx)
      fence[rail][idx] = letter
    end

    fence
  end

  def self.proper_rail(rails_count, iteration)
    # Here we get the mirrored index, so for a fence with 3 rails
    # we'll end up with
    #
    # [0, nil, nil, nil, 0]
    # [0,  1,  nil,  1,  0]
    # [0,  1,   2 ,  1,  0]
    #
    xablau = Array.new(2 * rails_count - 1)
    rails_count.times do |idx|
      xablau[idx] = idx
      xablau[-1 - idx] = idx
    end

    # Now we remove the last item of the array, since it will be
    # the beginning of the next cycle.
    #
    # So, for the fence described above, we go from
    #
    # [0, 1, 2, 1, 0]
    #
    # to
    #
    # [0, 1, 2, 1]
    #
    xablau.pop

    xablau[iteration % xablau.length]
  end
end
