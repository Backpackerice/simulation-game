class CreateFutures < ActiveRecord::Migration
  def change
    create_table :futures do |t|
      t.integer :period
      t.references :game
      t.integer :settlement_period
      t.decimal :price
      t.string :contractual_item

      t.timestamps
    end
  end
end
