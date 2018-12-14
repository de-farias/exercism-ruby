class ComplexNumber # :nodoc:
  attr_reader :real, :imaginary

  def initialize(real, imaginary)
    @real      = real
    @imaginary = imaginary
  end

  def abs
    # |z| = sqrt(a^2 + b^2)
    Math.sqrt(real**2 + imaginary**2).abs
  end

  def conjugate
    ComplexNumber.new(real, -imaginary)
  end

  def exp
    # e^(a + i * b) = e^a * e^(i * b)
    # e^(i * b) = cos(b) + i * sin(b)
    # >> e^(a + i * b) = e^a * (cos(b) + i * sin(b))
    # >> e^(a + i * b) = e^a * cos(b) + e^a * i * sin(b)

    ComplexNumber.new(Math.exp(real) * Math.cos(imaginary),
                      Math.exp(real) * Math.sin(imaginary).round(15))
  end

  def +(other)
    # (a + i * b) + (c + i * d) = (a + c) + (b + d) * i
    ComplexNumber.new(real + other.real, imaginary + other.imaginary)
  end

  def -(other)
    # (a + i * b) - (c + i * d) = (a - c) + (b - d) * i
    ComplexNumber.new(real - other.real, imaginary - other.imaginary)
  end

  def *(other)
    # (a + i * b) * (c + i * d) = (a * c - b * d) + (b * c + a * d) * i
    ComplexNumber.new((real * other.real - imaginary * other.imaginary),
                      (imaginary * other.real + real * other.imaginary))
  end

  def /(other)
    # (a + i * b) / (c + i * d) = (a * c + b * d)/(c^2 + d^2) + (b * c - a * d)/(c^2 + d^2) * i
    ComplexNumber.new((real * other.real + imaginary * other.imaginary).to_f / (other.real**2 + other.imaginary**2),
                      (imaginary * other.real - real * other.imaginary).to_f / (other.real**2 + other.imaginary**2))
  end

  def ==(other)
    real == other.real && imaginary == other.imaginary
  end
end
