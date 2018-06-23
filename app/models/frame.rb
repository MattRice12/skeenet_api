### Schema
  # t.integer :number
  # t.timestamps

class Frame < ApplicationRecord
  has_many :scores
end
