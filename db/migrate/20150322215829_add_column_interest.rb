class AddColumnInterest < ActiveRecord::Migration
  def change
    add_column :games, :interest, :decimal, default: 0.04
  end
end
