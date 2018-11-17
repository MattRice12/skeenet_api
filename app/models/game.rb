### Schema
  # t.integer :number
  # t.timestamps

class Game < ApplicationRecord
  has_many :scores, dependent: :destroy
  has_many :game_teams, dependent: :destroy

  has_many :teams, through: :game_teams
  has_many :players, through: :teams

  belongs_to :season
  belongs_to :week

  validate :two_teams_exist

  def two_teams_exist
    if teams.length < 2
      errors.add(:two_teams, "must exist")
    end
  end
end
