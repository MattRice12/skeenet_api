class ScoresController < ApplicationController
  def index
    begin
      scores = Score.all
      render json: { scores: scores }
    rescue
      render json: { error: INDEX_ERROR, status: 500 }
    end
  end

  # def player_score
  #   valid_request, missing_params = all_score_params_present?
  #   if valid_request
  #     score = Score.find_by({
  #       player_id: params.fetch(:player_id),
  #       frame_id: params.fetch(:frame_id),
  #       team_id: params.fetch(:team_id),
  #       game_id: params.fetch(:game_id)
  #       })
  #
  #     if score
  #       return render json: { score: score }
  #     end
  #   else
  #     error_message = "The request is missing the following params: " + missing_params[0..-2].join(", ")
  #     render json: { error: error_message, status: 404 }
  #   end
  # end

  def game_scores
    if params.fetch(:game_id)
      scores = Score.where(game_id: params[:game_id])
      return render json: { scores: scores }
    end
    render json: { error: "Scores not found for this game", status: 404 }
  end

  def team_scores
    if params.fetch(:team_id)
      scores = Score.where(team_id: params[:team_id])
      return render json: { scores: scores }
    end
    render json: { error: "Scores not found for this team", status: 404 }
  end

  private

  # def all_score_params_present?
  #   missing_params = []
  #
  #   missing_params.push("player_id") unless params[:player_id]
  #   missing_params.push("frame_id") unless params[:frame_id]
  #   missing_params.push("team_id") unless params[:team_id]
  #   missing_params.push("game_id") unless params[:game_id]
  #
  #   return [true, []] if missing_params.blank?
  #   [false, missing_params]
  # end

end
