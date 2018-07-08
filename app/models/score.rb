### Schema
  # t.belongs_to :player, foreign_key: true
  # t.belongs_to :frame, foreign_key: true
  # t.belongs_to :team, foreign_key: true
  # t.belongs_to :game, foreign_key: true

  # t.integer :points
  # t.timestamps

class Score < ApplicationRecord
  belongs_to :player
  belongs_to :frame
  belongs_to :team
  belongs_to :game

  validates :player_id, presence: true
  validates :frame_id, presence: true
  validates :team_id, presence: true
  validates :game_id, presence: true
  validates :points, presence: true
end
