class Isogram
  def self.isogram?(input)
    input.gsub(/\s|-/, '')
         .upcase
         .chars
         .each_with_object({}) do |char, obj|

      return false unless obj[char].nil?
      obj[char] = :exists
    end

    true
  end
end
