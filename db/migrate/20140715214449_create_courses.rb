class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string       :course_title, default: ""
      t.integer      :course_code, default: ""
      t.string  	 :quarter, default: ""
      t.string  	 :instructor, default: ""

      	t.timestamps
    end
  end
end
