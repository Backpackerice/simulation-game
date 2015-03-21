class ChangeColumnLifestockCrops < ActiveRecord::Migration
  def change
    change_column :crops, :harvested, :integer, default: 0
    change_column :lifestocks, :butchered, :integer, default: 0
  end
end
