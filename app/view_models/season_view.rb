class SeasonView
  def initialize(season)
    sql = <<-SQL
      SELECT t.id, g.week, t.name, SUM(sc.points) as Total
      FROM seasons as s
      JOIN games as g
      ON s.id = g.season_id
      JOIN game_teams as gt
      ON g.id = gt.game_id
      JOIN teams as t
      ON t.id = gt.team_id
      JOIN scores AS sc
      ON t.id = sc.team_id
      AND g.id = sc.game_id
      WHERE s.id = #{season.id}
      GROUP BY 1, 2
      ORDER BY 2;
    SQL

    team_scores = ActiveRecord::Base.connection.exec_query(sql)

    @season = {
      id: season.id,
      name: season.name,
      year: season.year,
      teams: team_scores_hash(team_scores)
    }
  end

  private

  def team_scores_hash(team_scores)
    team_scores.pluck("name")
               .uniq
               .map { |name| build_scores(team_scores, name) }
  end

  def build_scores(team_scores, name)
    filteredTeams = team_scores.select { |team| team["name"] == name }

    filteredTeams.each_with_object({ name: name }) do |team, acc|
      obj = { week: team["week"], total: team["total"] }
      if acc[:scores]
        acc[:scores].push(obj)
      else
        acc[:scores] = [obj]
      end
    end
  end
end
