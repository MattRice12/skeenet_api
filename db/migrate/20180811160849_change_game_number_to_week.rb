class ChangeGameNumberToWeek < ActiveRecord::Migration[5.1]
  def change
    rename_column :games, :number, :week
  end
end
