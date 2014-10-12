class CreateJoinTableCourseUser < ActiveRecord::Migration
  def change
    create_join_table :courses, :users do |t|
      # t.index [:course_id, :campus_id]
      # t.index [:campus_id, :course_id]
    end
  end
end
