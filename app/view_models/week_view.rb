class WeekView
  def initialize(week)

    @week = {
      id: week.id,
      week_number: week.week_number,
      season: {
        id: week.season.id,
        name: week.season.name,
        year: week.season.year
      },
      games: week.games.map { |game|
        {
          id: game.id,
          season_id: game.season.id,
          week_id: game.week.id,
          teams: game.teams.map { |team|
            {
              id: team.id,
              name: team.name
            }
          }
        }
      }
    }
  end

end
