class GamesController < ApplicationController
  def index
    games  = Game.all.includes(:teams)

    render json: games
  end

  def show
    game = Game.find_by(id: params.fetch(:id))
    render json: GameView.new(game)
  end

  def teams
    game = Game.find_by(id: params.fetch(:game_id))
    if game
      return render json: { teams: game.teams }
    end
    render json: { error: "Game not found.", status: 404 }
  end
end
