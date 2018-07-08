class PlayersController < ApplicationController
  def index
    begin
      players = Player.all
      players_hash = players.map do |player|
        {
          id: player.id,
          first_name: player.first_name,
          last_name: player.last_name,
          nickname: player.first_name,
          email: player.email,
          teams: player.teams
        }
      end
      render json: { players: players_hash }
    rescue
      render json: { error: INDEX_ERROR, status: 500 }
    end
  end

  def show
    player = Player.find_by(id: params.fetch(:id))

    if player
      player_hash = {
          id: player.id,
          first_name: player.first_name,
          last_name: player.last_name,
          nickname: player.first_name,
          email: player.email,
          teams: player.teams
        }
      return render json: { player: player_hash }
    end
    render json: { error: "Player not found.", status: 404 }
  end
end
