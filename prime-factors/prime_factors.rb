class PrimeFactors
  def self.for(value)
    [].tap do |factors|
      divisor = 2

      loop do
        break unless value > 1

        result, remainder = value.divmod(divisor)
        if remainder.zero?
          factors << divisor
          value = result
        else
          divisor += 1
        end
      end
    end
  end
end
