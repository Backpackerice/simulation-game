class CreateMachinery < ActiveRecord::Migration
  def change
    create_table :machineries do |t|
      t.string :type, index: true
      t.decimal :unit_value, precision: 5
      t.integer :age
      t.integer :periods_since_maintenance
      t.references :user, index: true
    end
  end
end
