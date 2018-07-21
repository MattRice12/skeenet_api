class GameSerializer < ActiveModel::Serializer
  attributes :id, :number

  has_many :players, through: :teams
  has_many :teams
end
