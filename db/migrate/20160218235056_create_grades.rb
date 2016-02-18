class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :studentID
      t.integer :courseID
      t.string :value

      t.timestamps null: false
    end
  end
end
