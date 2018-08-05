class GameSerializer < ActiveModel::Serializer
  attributes :id, :number

  has_many :teams

  belongs_to :season
end
