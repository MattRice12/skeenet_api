class GameView

  def initialize(games)
    games.map { |game|
      {
        id: game.id,
        number: game.number,
        players: game.players.map { |player|
          {
            id: player.id,
            first_name: player.first_name,
            last_name: player.last_name,
            nickname: player.nickname,
            email: player.email,
            team_id: player.team_ids.select { |t_id| game.teams.pluck(:id).include?(t_id) }.first
          }
        }
      }
    }
  end
end
