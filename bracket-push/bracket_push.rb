class Brackets
  def self.paired?(string)
    stack = []

    brackets_from(string).each do |bracket|
      if matching_brackets?(stack.last, bracket)
        stack.pop
      else
        stack.push(bracket)
      end
    end

    stack.empty?
  end

  def self.brackets_from(string)
    string.gsub(/[^\(\)\[\]\{\}]/, '').chars
  end

  def self.matching_brackets?(bracket, candidate)
    expected = case bracket
               when '{' then '}'
               when '(' then ')'
               when '[' then ']'
               end

    candidate.eql?(expected)
  end
end
