class GamesController < ApplicationController
  def index
    games = Game.all
    frames = Frame.all

    render json: {
      games: games,
      frames: frames
    }
  end

  def show
    game = Game.find_by(id: params.fetch(:id))

    render json: {
      game: game
    }
  end
end
