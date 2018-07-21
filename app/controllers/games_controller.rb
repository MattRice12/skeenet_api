class GamesController < ApplicationController
  def index
    @games   = Game.all.includes(players: :teams)
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
              team_id: player.team_ids.select { |t_id| game.teams.pluck(:id).include?(t_id) }.first,
              scores: player.scores.where(game_id: game.id)
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
      game:{
        id: game.id,
        number: game.number,
        players: game.players.map { |player|
          {
            id: player.id,
            first_name: player.first_name,
            last_name: player.last_name,
            nickname: player.nickname,
            email: player.email,
            team_id: player.team_ids.select { |t_id| game.teams.pluck(:id).include?(t_id) }.first,
            scores: player.scores.where(game_id: game.id)
          }
        }
      }
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
