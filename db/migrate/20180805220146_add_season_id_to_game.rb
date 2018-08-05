class AddSeasonIdToGame < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :season_id, :integer
    add_index  :games, :season_id
  end
end
