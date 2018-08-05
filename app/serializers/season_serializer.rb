class SeasonSerializer < ActiveModel::Serializer
  attributes :id, :name, :year

  has_many :games
end
