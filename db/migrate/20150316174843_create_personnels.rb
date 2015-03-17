class CreatePersonnels < ActiveRecord::Migration
  def change
    create_table :personnels do |t|
      t.string :position
      t.integer :salary
      t.integer :quantity
      t.integer :period
      t.references :liability_id, index: true
      t.references :game_id, index: true

      t.timestamps
    end
  end
end
