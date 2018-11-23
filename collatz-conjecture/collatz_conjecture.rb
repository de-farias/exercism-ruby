class CollatzConjecture
  def self.steps(number)
    raise ArgumentError unless number > 0

    count_steps(number)
  end

  def self.count_steps(number, steps_taken = 0)
    return steps_taken if number == 1

    if number.even?
      count_steps(number / 2, steps_taken + 1)
    else
      count_steps(number * 3 + 1, steps_taken + 1)
    end
  end
end
