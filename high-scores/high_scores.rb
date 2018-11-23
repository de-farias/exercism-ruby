class HighScores
  attr_reader :scores

  def initialize(scores)
    @scores = scores
  end

  def latest
    scores.last
  end

  def highest
    scores.max
  end

  def top
    scores.sort.reverse.first(3)
  end

  def report
    response = "Your latest score was #{latest}."
    if highest == latest
      response += " That's your personal best!"
    else
      difference = highest - latest
      response  += " That's #{difference} short of your personal best!"
    end

    response
  end
end
