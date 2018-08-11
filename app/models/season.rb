class Season < ApplicationRecord
  has_many :games
  has_many :teams, through: :games

  validates :year, presence: true

  def self.current_season
    Season.last
  end
end
