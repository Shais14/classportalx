class AddcolumnsMessages < ActiveRecord::Migration
  def change
    add_column :messages, :sender_id ,:string
    add_column :messages, :receiver_id,:string

  end
end
