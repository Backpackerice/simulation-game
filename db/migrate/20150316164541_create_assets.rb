class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :type
      t.integer :amount
      t.integer :period
      t.text :description

      t.timestamps
    end
  end
end
