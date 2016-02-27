class DropMessages < ActiveRecord::Migration
  def change
    drop_table :messages
    
    create_table :messages do |t|
      
      t.string :content
      t.string :sender_id
      t.string :receiver_id
      
      t.timestamps null: false
    end
  end
end
