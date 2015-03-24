class AddColumnToLifestock < ActiveRecord::Migration
  def change
    add_column :lifestocks, :butchered, :integer, default: 0
  end
end
