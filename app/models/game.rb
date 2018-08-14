### Schema
  # t.integer :number
  # t.timestamps

class Game < ApplicationRecord
  has_many :scores
  has_many :game_teams

  has_many :teams, through: :game_teams
  has_many :players, through: :teams

  belongs_to :season
  belongs_to :week
end
