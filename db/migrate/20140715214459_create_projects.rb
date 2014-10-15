class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.belongs_to 	 :group, :default=> ""
      t.belongs_to  :course, :default=> ""
      	t.timestamps
    end
  #  add_index :projects, ["course_id"],["group_id"]
  end
end
