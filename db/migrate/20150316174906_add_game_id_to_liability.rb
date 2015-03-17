class AddGameIdToLiability < ActiveRecord::Migration
  def change
    add_column :liabilities, :game_id, :integer
  end
end
