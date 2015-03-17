class AddGameIdToAsset < ActiveRecord::Migration
  def change
    add_column :assets, :game_id, :integer
  end
end
