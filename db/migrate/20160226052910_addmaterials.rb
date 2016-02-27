class Addmaterials < ActiveRecord::Migration
  def change
     add_column :courses, :material, :string
  end
end
