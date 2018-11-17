class GamesController < ApplicationController
  def index
    games  = Game.all.includes(:teams)

    render json: games
  end

  def show
    game = Game.find_by(id: params.fetch(:id))
    render json: GameView.new(game)
  end

  def create
    game = Game.new

    game.team_ids = game_params.fetch(:team_ids).split(",")
    game.season = Season.last
    game.week = Week.last

    if game.save
      return render json: GameView.new(game)
    end
    render json: { error: game.errors.full_messages, status: 422 }
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
end
