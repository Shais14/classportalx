class AddRequestInactiveToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :requestedInactive, :boolean
  end
end
