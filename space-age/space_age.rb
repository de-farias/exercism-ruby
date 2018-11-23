class SpaceAge
  ON_MERCURY_FACTOR = 0.2408467
  ON_VENUS_FACTOR   = 0.61519726
  ON_MARS_FACTOR    = 1.8808158
  ON_JUPITER_FACTOR = 11.862615
  ON_SATURN_FACTOR  = 29.447498
  ON_URANUS_FACTOR  = 84.016846
  ON_NEPTUNE_FACTOR = 164.79132

  def initialize(seconds_old)
    @seconds_old = seconds_old
  end

  def on_earth
    @seconds_old / 31_557_600.0
  end

  def method_missing(method_name, *args, &block)
    if method_name.to_s.start_with?('on_')
      on_earth / self.class.const_get("#{method_name.upcase}_FACTOR")
    else
      super
    end
  end
end
