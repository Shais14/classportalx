class CreateUserHistories < ActiveRecord::Migration
  def change
    create_table :user_histories do |t|
      t.integer :user_id
      t.integer :course_id
      t.string :action

      t.timestamps null: false
    end
  end
end
