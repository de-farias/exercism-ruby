require 'set'

class Sieve
  BOTTOM_LIMIT = 2

  def initialize(limit)
    @numbers    = (BOTTOM_LIMIT..limit).to_a
    @non_primes = Set.new
  end

  def primes
    numbers.each do |number|
      multiplier = 2
      loop do
        multiple = number * multiplier
        break if multiple > numbers.last

        non_primes << multiple
        multiplier += 1
      end
    end

    numbers - non_primes.to_a
  end

  private

  attr_reader :numbers, :non_primes
end
