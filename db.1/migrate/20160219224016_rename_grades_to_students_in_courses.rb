class RenameGradesToStudentsInCourses < ActiveRecord::Migration
  def change
     rename_table :grades, :students_courses
   end 
end
