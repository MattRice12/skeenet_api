class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.belongs_to :team, foreign_key: true

      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :email

      t.timestamps
    end
  end
end
