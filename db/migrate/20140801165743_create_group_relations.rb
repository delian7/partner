class CreateGroupRelations < ActiveRecord::Migration
  def change
    create_table :group_relations do |t|
	  t.belongs_to  :group
	  t.belongs_to  :user
    t.belongs_to  :project
    t.belongs_to  :course
	  t.time :accepted_at
	  t.integer :status, default: 0, null: false
    	t.timestamps
    end
    #add_index :group_relations, ["group_id"],["user_id"]
  end
end
