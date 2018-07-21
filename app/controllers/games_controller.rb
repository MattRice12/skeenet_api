class GamesController < ApplicationController
  def index
    @games = Game.all
    @frames = Frame.all

    render json: {
      games: @games.map { |game|
        {
          id: game.id,
          number: game.number,
          players: game.players.map { |player|
            {
              id: player.id,
              first_name: player.first_name,
              last_name: player.last_name,
              nickname: player.nickname,
              email: player.email,
              team_id: player.teams_id.select { |t_id| game.teams.pluck(:id).include?(t_id) }.first
            }
          }
        }
      },
      frames: @frames
    }

  end

  def show
    game = Game.find_by(id: params.fetch(:id))

    render json: {
      game: game
    }
  end

  def teams
    game = Game.find_by(id: params.fetch(:game_id))
    if game
      return render json: { teams: game.teams }
    end
    render json: { error: "Game not found.", status: 404 }
  end
end
