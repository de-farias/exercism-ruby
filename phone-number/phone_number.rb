module StringRefinements
  refine String do
    def numbers_only
      gsub(/\D/, '')
    end

    def starts_with?(*tested_chars)
      tested_chars.include?(chars.first)
    end
  end
end

class PhoneNumber
  using StringRefinements

  PHONE_FORMAT = /^1?(\d{3})(\d{3})(\d{4})$/

  def self.clean(phone)
    new(phone).clean
  end

  def initialize(phone)
    @area_code, @exchange_code, @subscriber_number = phone.numbers_only
                                                          .scan(PHONE_FORMAT)[0]
  end

  def clean
    return if invalid?

    phone_components.join
  end

  private

  attr_reader :area_code, :exchange_code, :subscriber_number

  def invalid?
    phone_components.any?(&:nil?) ||
      invalid_exchange_code?      ||
      invalid_area_code?
  end

  def invalid_area_code?
    area_code.starts_with?('0', '1')
  end

  def invalid_exchange_code?
    exchange_code.starts_with?('0', '1')
  end

  def phone_components
    [area_code, exchange_code, subscriber_number]
  end
end
