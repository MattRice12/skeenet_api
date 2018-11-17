class GamesController < ApplicationController
  def index
    begin
      games  = Game.all.includes(:teams)

      render json: games
    rescue
      render json: { error: INDEX_ERROR, status: 500 }
    end
  end

  def show
    game = Game.find_by(id: params.fetch(:id))
    render json: GameView.new(game)
  end

  def create
    team_ids = game_params.fetch(:team_ids).split(",").map(&:to_i)
    if team_ids.length < 2
      return render json: { error: "You must select two teams to start a game.", status: 422 }
    end

    game = current_weeks_games.find { |g| g.teams.pluck(:id).sort == team_ids.sort }

    if game.present?
      render json: GameView.new(game)
    else
      game = Game.new
      game.team_ids = team_ids
      game.season = Season.last
      game.week = Week.last

      if game.save
        return render json: GameView.new(game)
      end
      render json: { error: game.errors.full_messages, status: 422 }
    end
  end

  def teams
    game = Game.find_by(id: params.fetch(:game_id))
    if game
      return render json: { teams: game.teams }
    end
    render json: { error: "Game not found.", status: 404 }
  end

  private

  def game_params
    params.require(:game).permit(:team_ids)
  end

  def current_weeks_games
    Game.includes(:teams).where(season_id: Season.last.id, week_id: Week.last.id)
  end
end
