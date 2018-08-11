class GameSerializer < ActiveModel::Serializer
  attributes :id, :week

  has_many :teams

  belongs_to :season
end
