class Week < ApplicationRecord
  has_many :games

  belongs_to :season
end
