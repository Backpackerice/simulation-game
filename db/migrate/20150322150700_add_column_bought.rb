class AddColumnBought < ActiveRecord::Migration
  def change
    add_column :crops, :bought, :integer, default: 0
    add_column :lifestocks,:bought, :integer, default: 0
  end
end
