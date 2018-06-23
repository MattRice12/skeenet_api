module ApplicationHelper
  def frame_scores(frame, player, game, team)
    score = Score.find_by(frame_id: frame.id, player_id: player.id, game_id: game.id, team_id: team.id)
    return 0 if score.nil?
    score.points
  end

  def player_score(player, game, team)
    scores = Score.where(player_id: player.id, game_id: game.id, team_id: team.id)
    return 0 if scores.blank?
    scores.pluck(:points).sum
  end
end
