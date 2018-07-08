class RemoveTeamIdFromPlayers < ActiveRecord::Migration[5.1]
  def change
    remove_index :players, name: "index_players_on_team_id"
    remove_column :players, :team_id
  end
end
