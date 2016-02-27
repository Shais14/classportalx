class RenameStudentsCoursesToStudentCourses < ActiveRecord::Migration
  def change
    rename_table :students_courses, :student_courses
  end
end
