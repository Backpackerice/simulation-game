class RemoveColumnsFromPersonnel < ActiveRecord::Migration
  def change
    remove_column :personnels, :liability_id_id
    remove_column :personnels, :game_id_id
  end
end
