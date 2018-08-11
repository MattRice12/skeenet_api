class Season < ApplicationRecord
  has_many :games
  has_many :teams, through: :games
  
  validates :year, presence: true
end
