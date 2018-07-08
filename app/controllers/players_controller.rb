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

  def create
    player = Player.new(player_params)

    if player.save
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
    render json: { error: player.errors.full_messages, status: 422 }
  end

  def update
    player = Player.find_by(id: params.fetch(:id))

    if player.update(player_params)
      return render json: { player: player }
    end
    render json: { errors: player.errors.full_messages, status: 422 }
  end

  def delete
    player = Player.find_by(id: params.fetch(:id))

    if player.destroy
      return render json: { message: "Player destroyed!" }
    end
    return render json: { error: player.errors.full_error_messages, status: 404 }
  end

  private

  def player_params
    params.require(:player).permit(:first_name, :last_name, :nickname, :email, player_team_attributes: [:team_id])
  end
end
