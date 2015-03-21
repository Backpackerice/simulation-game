class AddColumnToCrops < ActiveRecord::Migration
  def change
    add_column :crops, :harvested, :boolean, default: false
  end
end
