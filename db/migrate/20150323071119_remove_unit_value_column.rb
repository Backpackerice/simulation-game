class RemoveUnitValueColumn < ActiveRecord::Migration
  def change
    remove_column :crops, :unit_value
    remove_column :lifestocks, :unit_value
    remove_column :machineries, :unit_value
  end
end
