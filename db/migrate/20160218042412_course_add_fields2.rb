class CourseAddFields2 < ActiveRecord::Migration
  def change
      add_column :courses, :instructor, :string
      add_column :courses, :start_date, :date
      add_column :courses, :end_date, :date
      add_column :courses, :status, :string
  end
end
