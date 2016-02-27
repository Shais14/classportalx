class TransformStudentsCoursesTable < ActiveRecord::Migration
  def change
    rename_column :students_courses, :value, :grade
    add_column :students_courses, :enrolled, :boolean, default: false
    add_column :students_courses, :requested, :boolean, default: true
  end
end
