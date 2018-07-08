class TeamsController < ApplicationController
  def index
    begin
      teams = Team.all

      render json: { teams: teams }
    rescue
      render json: { error: INDEX_ERROR, status: 500 }
    end
  end

  def show
    team = Team.find_by(id: params.fetch(:id))

    if team
      return render json: { team: team }
    end
    render json: { error: "Team not found.", status: 404 }
  end

  def create
    team = Team.new(team_params)

    if team.save
      return render json: { team: team }
    end
    render json: { errors: team.errors.full_error_messages, status: 404 }
  end

  def update
    team = Team.find_by(id: params.fetch(:id))

    if team.update(team_params)
      return render json: { team: team }
    end
    render json: { errors: team.errors.full_messages, status: 422 }
  end

  def delete
    team = Team.find_by(id: params.fetch(:id))

    if team.destroy
      return render json: { message: "Team destroyed!" }
    end
    return render json: { error: team.errors.full_error_messages, status: 404 }
  end

  def players
    team = Team.find_by(id: params.fetch(:team_id))

    if team
      return render json: { players: team.players }
    end
    render json: { error: "Team not found.", status: 404 }
  end

  private
  def team_params
    params.require(:team).permit(:name, :active)
  end
end
