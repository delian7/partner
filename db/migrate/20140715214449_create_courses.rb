class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string   :course_title, :default => ""
      t.integer  :course_id, :default=> ""
      t.string   :projects, :default=> ""


      t.timestamps
    end
  end
end
