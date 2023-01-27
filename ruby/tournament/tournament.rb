=begin
Write your code for the 'Tournament' exercise in this file. Make the tests in
`tournament_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/tournament` directory.
=end
module Tournament
  class << self
    def tally(results_input)
      ordered_results = results_input.each_line.with_object({}) do |line, results_by_team|
        case line.split(";").map(&:strip)
        in [team_a, team_b, outcome]
          save_score(team_a, team_b, outcome, results_by_team)
        else
          {}
        end
      end
      display(ordered_results.sort_by { |k, v| [v[:P]]}.reverse )
    end

  private

    def display(results)
      score_board = "#{"Team".ljust(31, " ")}| MP |  W |  D |  L |  P\n"
      results.each do |team, values|
        score_board << "#{team.ljust(31, " ")}|#{values[:MP].to_s.rjust(3, " ")} |#{values[:W].to_s.rjust(3, " ")} |#{values[:D].to_s.rjust(3, " ")} |#{values[:L].to_s.rjust(3, " ")} |#{values[:P].to_s.rjust(3, " ")}\n"
      end
      score_board
    end

    def save_score(team_a, team_b, outcome, scores)


      case outcome
      when "win"
        apply_win(team_a, team_b, scores)
      when 'draw'
        apply_draw(team_a, team_b, scores)
      when 'loss'
        apply_win(team_b, team_a, scores)
      else
        raise ArgumentError, "Unexpected match outcome, expected values are win, draw or loss"
      end
    end

    def init_scores_for_team(team, scores)
      scores[team] = {MP: 0, W: 0, D: 0, L: 0, P: 0} unless scores.key? team
    end

    def apply_win(team_a, team_b, scores)
      init_scores_for_team(team_a, scores)
      init_scores_for_team(team_b, scores)
      scores[team_a][:W] += 1
      scores[team_a][:P] += 3
      scores[team_b][:L] += 1
      scores[team_a][:MP] += 1
      scores[team_b][:MP] += 1
    end

    def apply_draw(team_a, team_b, scores)
      init_scores_for_team(team_b, scores)
      init_scores_for_team(team_a, scores)
      scores[team_a][:D] += 1
      scores[team_a][:P] += 1
      scores[team_b][:D] += 1
      scores[team_b][:P] += 1
      scores[team_a][:MP] += 1
      scores[team_b][:MP] += 1
    end
  end
end