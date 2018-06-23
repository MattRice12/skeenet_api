class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
