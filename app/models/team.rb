### Schema
  # t.string :name
  # t.boolean :active, default: true
  # t.timestamps

class Team < ApplicationRecord
  has_many :scores
  has_many :player_teams
  has_many :game_teams

  has_many :players, through: :player_teams
  has_many :games, through: :game_teams
end
