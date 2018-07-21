class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :active

  belongs_to :game
end
