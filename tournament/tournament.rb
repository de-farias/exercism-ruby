class Tournament
  HEADER = 'Team                           | MP |  W |  D |  L |  P'.freeze
  POINTS_PER_WIN  = 3
  POINTS_PER_DRAW = 1

  def self.tally(input)
    new(input).tally
  end

  def initialize(input)
    @input = input
    @teams = {}

    calulate_teams_stats!
  end

  def tally
    [HEADER, *team_stats].join("\n") + "\n"
  end

  private

  attr_reader :input, :teams

  def team_stats
    ordered_teams = teams.values.sort_by { |team| [-team.points, team.name] }
    ordered_teams.map(&:to_s)
  end

  def calulate_teams_stats!
    input.split("\n").each do |line|
      first_team, adversary, result = line.chomp.split(';')
      home   = fetch_team(first_team)
      away   = fetch_team(adversary)
      winner = case result
               when 'win'  then home
               when 'loss' then away
               end

      compute_match_result(teams: [home, away], winner: winner)
    end
  end

  def fetch_team(team_name)
    teams[team_name] ||= TeamStats.new(team_name)
  end

  def compute_match_result(teams:, winner: nil)
    if winner.nil?
      teams.each(&:draw!)
    else
      winner.win!
      (teams - [winner]).each(&:lose!)
    end
  end
end

class TeamStats
  attr_reader :team_name

  alias name team_name

  def initialize(team_name)
    @team_name = team_name
    @wins = @losses = @draws  = 0
  end

  def win!
    @wins += 1
  end

  def lose!
    @losses += 1
  end

  def draw!
    @draws += 1
  end

  def points
    wins * Tournament::POINTS_PER_WIN + draws * Tournament::POINTS_PER_DRAW
  end

  def to_s
    [
      formatted_name,
      formatted_matches_played_stats,
      formatted_win_stats,
      formatted_draw_stats,
      formatted_loss_stats,
      formatted_points_stats
    ].join('|')
  end

  private

  attr_reader :wins, :draws, :losses

  def matches_played
    @matches_played ||= wins + losses + draws
  end

  def formatted_name
    team_name.ljust(31)
  end

  def formatted_matches_played_stats
    matches_played.to_s.rjust(3).ljust(4)
  end

  def formatted_win_stats
    wins.to_s.rjust(3).ljust(4)
  end

  def formatted_draw_stats
    draws.to_s.rjust(3).ljust(4)
  end

  def formatted_loss_stats
    losses.to_s.rjust(3).ljust(4)
  end

  def formatted_points_stats
    points.to_s.rjust(3)
  end
end
