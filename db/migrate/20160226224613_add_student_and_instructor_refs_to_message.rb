class AddStudentAndInstructorRefsToMessage < ActiveRecord::Migration
  def change
    add_reference :messages, :student, index: true, foreign_key: true
    add_reference :messages, :instructor, index: true, foreign_key: true
  end
end
