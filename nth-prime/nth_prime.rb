class Prime
  def self.nth(desired_prime_idx)
    raise ArgumentError if desired_prime_idx < 1

    primes = []
    value  = 2

    loop do
      break if primes.length == desired_prime_idx

      primes << value if prime?(value, primes)
      value  += 1
    end

    primes.last
  end

  def self.prime?(value, primes)
    primes.none? { |prime| (value % prime).zero? }
  end
end
