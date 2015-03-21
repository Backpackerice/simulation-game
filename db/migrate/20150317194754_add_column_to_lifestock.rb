class AddColumnToLifestock < ActiveRecord::Migration
  def change
    add_column :lifestocks, :butchered, :boolean, default: false
  end
end
