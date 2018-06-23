### Schema
  # t.belongs_to :game, foreign_key: true
  # t.belongs_to :team, foreign_key: true
  # t.timestamps

class GameTeam < ApplicationRecord
  belongs_to :game
  belongs_to :team
end
