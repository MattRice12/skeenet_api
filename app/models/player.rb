### Schema
  # t.belongs_to :team, foreign_key: true

  # t.string :first_name
  # t.string :last_name
  # t.string :nickname
  # t.string :email
  # t.timestamps

class Player < ApplicationRecord
  has_many :scores
  has_many :player_teams

  has_many :teams, through: :player_teams
  accepts_nested_attributes_for :player_teams

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :nickname, presence: true
  validates :email, presence: true
end
