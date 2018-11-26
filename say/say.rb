class Say
  def initialize(number)
    @number = number.to_s
  end

  def in_english(number = @number)
    case number.to_i
    when 0 then 'zero'
    when 1 then 'one'
    when 2 then 'two'
    when 3 then 'three'
    when 4 then 'four'
    when 5 then 'five'
    when 6 then 'six'
    when 7 then 'seven'
    when 8 then 'eight'
    when 9 then 'nine'
    when 10 then 'ten'
    when 11 then 'eleven'
    when 12 then 'twelve'
    when 13 then 'thirteen'
    when 14 then 'fourteen'
    when 15 then 'fifteen'
    when 16 then 'sixteen'
    when 17 then 'seventeen'
    when 18 then 'eigtheen'
    when 19 then 'nineteen'
    when 20 then 'twenty'
    when 30 then 'thirty'
    when 40 then 'forty'
    when 50 then 'fifty'
    when 60 then 'sixty'
    when 70 then 'seventy'
    when 80 then 'eighty'
    when 90 then 'ninety'
    when 21..29, 31..39, 41..49, 51..59, 61..69, 71..79, 81..89, 91..99
      units = number.to_i % 10
      translation = "#{in_english(number.to_i - units)}-#{in_english(units)}"
      format_translation(translation, '-')
    when 100..999
      hundreds = number.to_i / 100
      translation = "#{in_english(hundreds)} hundred " \
                    "#{in_english(number.to_i % 100)}"
      format_translation(translation)
    when 1_000..999_999
      thousands = number.to_i / 1000
      translation = "#{in_english(thousands)} thousand " \
                    "#{in_english(number.to_i % 1_000)}"
      format_translation(translation)
    when 1_000_000..999_999_999
      millions = number.to_i / 1_000_000
      translation = "#{in_english(millions)} million " \
                    "#{in_english(number.to_i % 1_000_000)}"
      format_translation(translation)
    when 1_000_000_000..999_999_999_999
      billions = number.to_i / 1_000_000_000
      translation = "#{in_english(billions)} billion " \
                    "#{in_english(number.to_i % 1_000_000_000)}"
      format_translation(translation)
    else
      raise ArgumentError
    end
  end

  private

  attr_reader :number

  def format_translation(translation, connector = ' ')
    suffix = "#{connector}zero"

    if translation.end_with?(suffix)
      translation[0..(-suffix.length - 1)]
    else
      translation
    end
  end
end
