class GameView

  def initialize(game)
    @game = {
      id: game.id,
      number: game.number,
      teams: game.teams.map { |team|
        {
          id: team.id,
          name: team.name,
          active: team.active,
          players: team.players.map { |player|
            {
              id: player.id,
              first_name: player.first_name,
              last_name: player.last_name,
              nickname: player.nickname,
              email: player.email,
              scores: player.scores.where(game_id: game.id).map { |score|
                {
                  frame_id: score.frame_id,
                  points: score.points
                }
              }
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
