class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.belongs_to  :course, default: ""
      t.boolean :allow_repeat, default: false
      t.boolean :active, default: true
      t.integer :group_size, default: 2
      t.boolean :autogroup, default: false
      t.string :evaluation_id
      t.date :end_date
    end
   # add_index :projects, ["course_id"],["group_id"]
  end
end
