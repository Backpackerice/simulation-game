class AddGameToPrice < ActiveRecord::Migration
  def change
    add_column :prices, :game_id, :integer
  end
end
