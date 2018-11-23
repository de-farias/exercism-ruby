module StringRefinements
  refine String do
    def ends_with?(char)
      chars.last == char
    end

    def with_words?
      self =~ /[a-z]/i
    end

    def remove_special_characters
      gsub(/[\s|\t|\n]/, '')
    end
  end
end

class Bob
  using StringRefinements

  def self.hey(sentence)
    new(sentence).hey
  end

  def initialize(sentence)
    @sentence = sentence.remove_special_characters
  end

  def hey
    case
    when questioning? && yelling? then "Calm down, I know what I'm doing!"
    when questioning?             then 'Sure.'
    when yelling?                 then 'Whoa, chill out!'
    when silence?                 then 'Fine. Be that way!'
    else                               'Whatever.'
    end
  end

  private

  attr_reader :sentence

  def questioning?
    sentence.ends_with?('?')
  end

  def yelling?
    sentence.upcase == sentence && sentence.with_words?
  end

  def silence?
    sentence.empty?
  end
end
