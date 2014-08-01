class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.belongs_to :project, :default=> ""
      t.references   :user, :default=> ""
      t.string   :course_title, :default => ""


      t.timestamps
    end
  end
end
