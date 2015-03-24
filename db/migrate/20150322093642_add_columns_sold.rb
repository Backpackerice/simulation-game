class AddColumnsSold < ActiveRecord::Migration
  def change
    add_column :crops, :sold, :integer, default: 0
    add_column :lifestocks, :sold, :integer, default: 0
    add_column :machineries, :sold, :integer, default: 0
  end
end
