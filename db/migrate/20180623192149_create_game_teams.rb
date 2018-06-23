class CreateGameTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :game_teams do |t|
      t.belongs_to :game, foreign_key: true
      t.belongs_to :team, foreign_key: true

      t.timestamps
    end
  end
end
