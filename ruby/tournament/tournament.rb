# frozen_string_literal: true

module Tournament
  OPPOSITE = { 'win' => 'loss', 'loss' => 'win', 'draw' => 'draw' }.freeze
  POINTS = { 'win' => 3, 'draw' => 1, 'loss' => 0 }.freeze
  HEADER = "Team                           | MP |  W |  D |  L |  P\n"

  def self.tally(input)
    standings = Hash.new { |h, k| h[k] = { mp: 0, w: 0, d: 0, l: 0, p: 0 } }

    input.each_line(chomp: true) do |line|
      next if line.empty?

      team_a, team_b, outcome = line.split(';')
      record_match(standings, team_a, outcome)
      record_match(standings, team_b, OPPOSITE[outcome])
    end

    format_table(standings)
  end

  def self.record_match(standings, team, outcome)
    stats = standings[team]
    stats[:mp] += 1
    stats[outcome[0].to_sym] += 1
    stats[:p] += POINTS[outcome]
  end

  def self.format_table(standings)
    rows = standings.sort_by { |team, stats| [-stats[:p], team] }
                    .map { |team, stats| format_row(team, stats) }

    HEADER + rows.join
  end

  def self.format_row(team, stats)
    format("%-31s| %2d | %2d | %2d | %2d | %2d\n",
           team, stats[:mp], stats[:w], stats[:d], stats[:l], stats[:p])
  end
end
