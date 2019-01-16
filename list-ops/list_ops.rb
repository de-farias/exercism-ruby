class ListOps
  class << self
    def arrays(input)
      input.reduce(0) { |m, _| m + 1 }
    end

    def reverser(input)
      [].tap do |reversed|
        reversed << input.pop while input.any?
      end
    end

    def concatter(input1, input2)
      input1.tap do |concatted|
        concatted << input2.shift while input2.any?
      end
    end

    def mapper(input, &block)
      [].tap do |mapped|
        input.each do |item|
          mapped << yield(item)
        end
      end
    end

    def filterer(input, &block)
      [].tap do |mapped|
        input.each do |item|
          mapped << item if yield(item)
        end
      end
    end

    def sum_reducer(input)
      sum = 0
      input.each { |item| sum += item }

      sum
    end

    def factorial_reducer(input)
      product = 1
      input.each { |item| product *= item }

      product
    end
  end
end
