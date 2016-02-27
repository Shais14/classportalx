class ChangecolumnsMessages < ActiveRecord::Migration
  def change
    
    remove_column :messages, :student_id ,:string
    remove_column :messages, :instructor_id,:string

  end
end
