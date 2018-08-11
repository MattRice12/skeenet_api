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
          # players: team.players.map { |player|
            # player_scores = player.scores.where(game_id: game.id)
            players: sql_players(team).map { |player|
            player_scores = sql_player_scores(game, player)
            {
              id: player["id"],
              first_name: player["first_name"],
              last_name: player["last_name"],
              nickname: player["nickname"],
              email: player["email"],
              scores: player_scores.map { |score|
                {
                  frame_id: score["frame_id"],
                  points: score["points"],
                  prior_total: player_scores.select {|ps| ps["frame_id"] < score["frame_id"]}.pluck("points").sum
                }
              },
              total_score: player_scores.pluck("points").sum
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

  private

  def sql_players(team)
    sql_team = <<-SQL
      SELECT p.id, p.first_name, p.last_name, p.nickname, p.email
      FROM players p
      JOIN player_teams pt ON pt.player_id = p.id
      JOIN teams t ON pt.team_id = t.id
      WHERE t.id = #{team.id}
    SQL
    ActiveRecord::Base.connection.exec_query(sql_team)
  end

  def sql_player_scores(game, player)
    sql = <<-SQL
      SELECT s.points, s.frame_id
      FROM scores s
      WHERE s.game_id = #{game.id}
      AND s.player_id = #{player['id']};
    SQL
    ActiveRecord::Base.connection.exec_query(sql)
  end
end
