class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :period, index: true
      t.string :action
      t.text :message
      t.integer :game_id

      t.timestamps
    end
  end
end
