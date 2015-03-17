class AddColumnsToPersonnel < ActiveRecord::Migration
  def change
    add_column :personnels, :game_id, :integer
    add_column :personnels, :liability_id, :integer
  end
end
