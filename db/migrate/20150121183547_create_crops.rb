class CreateCrops < ActiveRecord::Migration
  def change
    create_table :crops do |t|
      t.string :type, index: true
      t.integer :quantity
      t.decimal :unit_value, precision: 5
      t.integer :age
      t.integer :periods_since_pesticide
      t.references :user, index: true
    end
  end
end
