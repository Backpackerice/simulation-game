class RenameTypeColumns < ActiveRecord::Migration
  def change
    rename_column :assets, :type, :kind
    rename_column :liabilities, :type, :kind
    rename_column :events, :type, :kind
  end
end
