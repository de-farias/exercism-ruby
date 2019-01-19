class OcrNumbers # :nodoc:
  ZERO  = ' _ | ||_|   '.freeze
  ONE   = '     |  |   '.freeze
  TWO   = ' _  _||_    '.freeze
  THREE = ' _  _| _|   '.freeze
  FOUR  = '   |_|  |   '.freeze
  FIVE  = ' _ |_  _|   '.freeze
  SIX   = ' _ |_ |_|   '.freeze
  SEVEN = ' _   |  |   '.freeze
  EIGHT = ' _ |_||_|   '.freeze
  NINE  = ' _ |_| _|   '.freeze
  DICTIONARY = Hash.new('?').merge(
    ZERO  => '0',
    ONE   => '1',
    TWO   => '2',
    THREE => '3',
    FOUR  => '4',
    FIVE  => '5',
    SIX   => '6',
    SEVEN => '7',
    EIGHT => '8',
    NINE  => '9'
  ).freeze

  class << self
    def convert(input)
      number_groups = parse(input)
      number_groups.map do |number_group|
        number_group.map { |code| DICTIONARY[code] }.join
      end.join(',')
    end

    private

    def parse(input)
      lines = input.split("\n")
      raise ArgumentError if wrong_number_of_lines?(lines) ||
                             wrong_number_of_columns?(lines)

      lines.each_slice(4).map { |group| numbers_from(group) }
    end

    def numbers_from(lines)
      numbers = Array.new(numbers_count(lines)) { [] }

      lines.each do |line|
        line.chars.each_slice(3).each_with_index do |slice, idx|
          numbers[idx].concat slice
        end
      end

      numbers.map(&:join)
    end

    def wrong_number_of_lines?(lines)
      lines.length % 4 != 0
    end

    def wrong_number_of_columns?(lines)
      lines.any? { |line| line.length % 3 != 0 }
    end

    def numbers_count(lines)
      lines_count      = lines.length / 4
      numbers_per_line = lines[0].length / 3

      lines_count * numbers_per_line
    end
  end
end
