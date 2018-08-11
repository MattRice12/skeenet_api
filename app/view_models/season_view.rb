class SeasonView

  def initialize(season)
    @season = {
      id: season.id,
      name: season.name,
      year: season.year,
      games: season.games.map { |game|
        {
          game: game.id,
          week: game.number,
          teams: game.teams.map { |team|
            {
              id: team.id,
              name: team.name,
              total: team.scores.sum(&:points)
            }
          }
        }
      }
    }
  end
end
