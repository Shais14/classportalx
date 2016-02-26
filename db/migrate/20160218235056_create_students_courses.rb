class CreateStudentsCourses < ActiveRecord::Migration
  def change
    create_table :students_courses do |t|
      t.string :value

      t.timestamps null: false
    end
  end
end
