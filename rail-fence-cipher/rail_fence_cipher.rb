class RailFenceCipher # :nodoc:
  def self.encode(message, rail_count)
    lookup = generate_lookup(message.length, rail_count)

    transcode(message, lookup)
  end

  def self.decode(message, rail_count)
    lookup = generate_lookup(message.length, rail_count)

    transcode(message, reverse_lookup(lookup))
  end

  def self.transcode(message, lookup)
    lookup.map { |index| message[index] }.join
  end

  def self.generate_lookup(length, count)
    rails = Array.new(count) { [] }
    (0...length).each do |index|
      rails[rail_index(index, count)] << index
    end

    rails.flatten
  end

  def self.reverse_lookup(lookup)
    lookup
      .each_with_index
      .each_with_object([]) do |(to, from), reverse_lookup|
        reverse_lookup[to] = from
      end
  end

  def self.rail_index(char_index, rail_count)
    idx = char_index % [1, rail_count * 2 - 2].max
    idx = rail_count - (idx - rail_count) - 2 if idx >= rail_count

    idx
  end
end
