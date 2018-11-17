class SeasonsController < ApplicationController
  def index
    begin
      seasons = Season.all.includes(:games)

      render json: seasons
    rescue
      render json: { error: INDEX_ERROR, status: 500 }
    end
  end

  def show
    # season = if params[:current_season]
    #   Season.current_season
    # else
    # end
    season = Season.find_by(id: params.fetch(:id))
    render json: SeasonView.new(season)
  end
end
