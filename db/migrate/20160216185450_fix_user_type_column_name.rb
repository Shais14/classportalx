class FixUserTypeColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :type, :privilege
  end
end
