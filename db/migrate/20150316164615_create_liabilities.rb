class CreateLiabilities < ActiveRecord::Migration
  def change
    create_table :liabilities do |t|
      t.string :type
      t.integer :amount
      t.integer :period
      t.text :description

      t.timestamps
    end
  end
end
