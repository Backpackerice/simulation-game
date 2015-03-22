class CreateInsurances < ActiveRecord::Migration
  def change
    create_table :insurances do |t|
      t.integer :period
      t.references :game, index: true
      t.string :item
      t.integer :quantity
      t.decimal :price_per_item

      t.timestamps
    end
  end
end
