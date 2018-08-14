class CreateWeeks < ActiveRecord::Migration[5.1]
  def change
    create_table :weeks do |t|
      t.integer :week_number, null: false
      t.references :season, index: true, foreign_key: true

      t.timestamps
    end
  end
end
