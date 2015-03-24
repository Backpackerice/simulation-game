class AddColumnToCrops < ActiveRecord::Migration
  def change
    add_column :crops, :harvested, :integer, default: 0
  end
end
