class ScoresController < ApplicationController
  def index
    begin
      scores = Score.all
      render json: { scores: scores }
    rescue
      render json: { error: INDEX_ERROR, status: 500 }
    end
  end

  def create
    score = Score.new(score_params)

    if score.save
      return render json: { score: score }
    end
    render json: { errors: score.errors.full_error_messages, status: 422 }
  end

  def update
    score = Score.find_by(id: params.fetch(:id))

    if score.update(score_params)
      return render json: { score: score }
    end
    render json: { errors: score.errors.full_error_messages, status: 422 }
  end

  def delete
    score = Score.find_by(id: params.fetch(:id))

    if score.update(points: 0)
      return render json: { score: score }
    end
    render json: { errors: score.errors.full_error_messages, status: 422 }
  end

  def game_scores
    game = Game.find_by(id: params.fetch(:game_id))
    if game
      return render json: { scores: game.scores }
    end
    render json: { error: "This game does not exist", status: 404 }
  end

  def team_scores
    team = Team.find_by(id: params.fetch(:team_id))
    if team
      return render json: { scores: team.scores }
    end
    render json: { error: "This team does not exist", status: 404 }
  end

  private
  def score_params
    params.require(:score).permit(:player_id, :frame_id, :team_id, :game_id, :points)
  end
end
