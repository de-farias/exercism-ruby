require 'date'

class Meetup
  def initialize(month, year)
    @month = month
    @year  = year
  end

  def day(weekday, descriptor)
    case descriptor
    when :teenth then filter(date_range(13, 19), weekday)[0]
    when :first  then filter(date_range, weekday)[0]
    when :second then filter(date_range, weekday)[1]
    when :third  then filter(date_range, weekday)[2]
    when :fourth then filter(date_range, weekday)[3]
    else              filter(date_range, weekday)[-1]
    end
  end

  private

  attr_reader :year, :month

  def filter(range, weekday)
    range.select { |date| date.send("#{weekday}?") }
  end

  def date_range(first_day = 1, last_day = -1)
    (Date.new(year, month, first_day)..Date.new(year, month, last_day)).to_a
  end
end
