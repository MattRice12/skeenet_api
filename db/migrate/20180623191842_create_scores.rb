class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.belongs_to :player, foreign_key: true
      t.belongs_to :frame, foreign_key: true
      t.belongs_to :team, foreign_key: true
      t.belongs_to :game, foreign_key: true
      t.integer :points

      t.timestamps
    end
  end
end
