class ChangecolumnsMessages1 < ActiveRecord::Migration
  def change
       remove_column :messages, :instructor_id,:string

  end
end
