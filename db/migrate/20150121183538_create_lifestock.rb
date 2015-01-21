class CreateLifestock < ActiveRecord::Migration
  def change
    create_table :lifestocks do |t|
      t.string :type, index: true
      t.integer :quantity
      t.decimal :unit_value, precision: 5
      t.integer :age
      t.integer :periods_since_vaccination
      t.references :user, index: true
    end
  end
end
