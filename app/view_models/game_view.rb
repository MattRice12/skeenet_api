class GameView

  def initialize(game)
    @game = {
      id: game.id,
      week: game.week,
      teams: game.teams.map { |team|
        {
          id: team.id,
          name: team.name,
          active: team.active,
          players: team.players.map { |player|
            player_scores = player.scores.where(game_id: game.id)
            {
              id: player.id,
              first_name: player.first_name,
              last_name: player.last_name,
              nickname: player.nickname,
              email: player.email,
              scores: player_scores.map { |score|
                {
                  frame_id: score.frame_id,
                  points: score.points,
                  prior_total: player_scores.select {|ps| ps.frame_id < score.frame_id}.pluck(:points).sum
                }
              },
              total_score: player_scores.pluck(:points).sum
            }
          }
        }
      },
      season: {
        id: game.season.id,
        name: game.season.name,
        year: game.season.year
      }
    }
  end
end
