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
      teams: team_scores_obj_new(team_scores)
    }
  end

  private

  def team_scores_obj_new(team_scores)
    team_scores.each_with_object({}) { |team, acc|
      obj = {"week_#{team["week"]}": team["total"] }

      if acc.dig(team["id"], :scores)
        acc[team["id"]][:scores].merge!(obj)
      else
        acc[team["id"]] = { name: team["name"], scores: obj }
      end
    }
  end

  def team_scores_obj_old(team_scores)
    team_scores.each_with_object({}) { |team, acc|
      obj = { "week_#{team["week"]}": team["total"] }

      if acc[team["name"]]
        acc[team["name"]].push(obj)
      else
        acc[team["name"]] = [obj]
      end
    }
  end
end
