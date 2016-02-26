class AddStudentAndCourseRefsToStudentsCourses < ActiveRecord::Migration
  def change
    add_reference :students_courses, :student, index: true, foreign_key: true
    add_reference :students_courses, :course, index: true, foreign_key: true
  end
end
