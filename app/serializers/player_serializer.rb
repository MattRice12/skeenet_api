class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :nickname, :email, :teams_id

  has_many :teams, through: :player_teams
end
