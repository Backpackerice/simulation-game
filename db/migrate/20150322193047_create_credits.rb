class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.integer :period
      t.references :game, index: true
      t.integer :principal
      t.integer :duration
      t.decimal :interest_rate
      t.boolean :paid
      t.integer :installments

      t.timestamps
    end
  end
end
