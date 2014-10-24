class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string       :course_title, :default => ""
      t.string  	 :instructor, :default=>""
      t.integer  	 :active_proj
      	t.timestamps
    end
  end
end
