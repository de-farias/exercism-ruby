require 'date'

class Meetup
  def initialize(month, year)
    @month = month
    @year  = year
  end

  def day(weekday, descriptor)
    case descriptor
    when :teenth
      date_range(13, 19).find { |date| date.send("#{weekday}?") }
    end
  end

  private

  attr_reader :year, :month

  def date_range(first_day, last_day)
    (Date.new(year, month, first_day)..Date.new(year, month, last_day)).to_a
  end
end
