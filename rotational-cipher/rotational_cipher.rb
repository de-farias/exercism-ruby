class RotationalCipher # :nodoc:
  LOWER = ('a'..'z').to_a
  UPPER = ('A'..'Z').to_a
  ALPHA = (LOWER + UPPER).join

  def self.rotate(letters, rotations)
    letters.tr(
      ALPHA,
      (LOWER.rotate(rotations) + UPPER.rotate(rotations)).join
    )
  end
end
