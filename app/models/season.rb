class Season < ApplicationRecord
  has_many :games

  validates :year, presence: true
end
