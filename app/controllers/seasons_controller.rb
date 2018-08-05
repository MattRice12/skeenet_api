class SeasonsController < ApplicationController
  def index
    seasons = Season.all.includes(:games)

    render json: seasons
  end

  def show
    season = Season.includes(:games).find_by(id: params.fetch(:id))
    render json: season
  end
end
