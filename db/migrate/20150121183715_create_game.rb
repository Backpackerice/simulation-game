class CreateGame < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :period
      t.decimal :cash, precision: 2
      t.references :user, index: true
    end
  end
end
