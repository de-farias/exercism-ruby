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
    when :first
      date_range(1).find { |date| date.send("#{weekday}?") }
    when :second
      date_range(1).select { |date| date.send("#{weekday}?") }[1]
    when :third
      date_range(1).select { |date| date.send("#{weekday}?") }[2]
    end
  end

  private

  attr_reader :year, :month

  def date_range(first_day, last_day = -1)
    first_date = Date.new(year, month, first_day)
    last_date  = Date.new(year, month, last_day)

    (first_date..last_date).to_a
  end
end
