class AddColumnQuantity < ActiveRecord::Migration
  def change
    add_column :futures, :quantity, :integer, default: 0
  end
end
