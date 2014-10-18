class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.belongs_to 	 :group, :default=> ""
      t.belongs_to  :course, :default=> ""
      t.boolean :active, :default=> "0" 
      t.timestamps
    end
  #  add_index :projects, ["course_id"],["group_id"]
  end
end
