class GamesController < ApplicationController
  def index
    games = Game.all
    frames = Frame.all

    render locals: {
      games: games,
      frames: frames
    }
  end
end
