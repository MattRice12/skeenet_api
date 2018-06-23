### Schema
  # t.belongs_to :player, foreign_key: true
  # t.belongs_to :team, foreign_key: true
  # t.timestamps

class PlayerTeam < ApplicationRecord
  belongs_to :player
  belongs_to :team
end
