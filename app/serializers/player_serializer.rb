class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :nickname, :email, :team_ids

  has_many :teams, through: :player_teams
end
