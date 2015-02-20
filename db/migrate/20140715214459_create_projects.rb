class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.boolean :allow_repeat, default: false
      t.integer :group_size, default: 2
      t.date :partnership_deadline
      t.date :evaluation_deadline
      t.boolean :limit_scope
    end
    # add_index :projects, ["course_id"],["group_id"]
  end
end
