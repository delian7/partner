class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.belongs_to  :course, default: ""
      t.boolean :allow_repeat, default: false
      t.integer :name_gen, default: 0, limit: 4
      t.boolean :allow_randomization
      t.boolean :active, default: true
      t.integer :group_size, default: 2
      t.boolean :autogroup, default: false
      t.timestamps
    end
   # add_index :projects, ["course_id"],["group_id"]
  end
end
