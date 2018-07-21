class GameSerializer < ActiveModel::Serializer
  attributes :id, :number

  has_many :teams
end
