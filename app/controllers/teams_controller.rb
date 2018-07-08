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
end
