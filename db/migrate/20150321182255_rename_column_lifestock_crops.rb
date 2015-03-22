class RenameColumnLifestockCrops < ActiveRecord::Migration
  def change
    rename_column :lifestocks, :periods_since_vaccination , :vaccinated
    rename_column :crops, :periods_since_pesticide , :sprayed
  end
end
