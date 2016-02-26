class AddStudentAndCourseRefsToGrades < ActiveRecord::Migration
  def change
    add_reference :grades, :student, index: true, foreign_key: true
    add_reference :grades, :course, index: true, foreign_key: true
  end
end
