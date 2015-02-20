class CreateGroupRelations < ActiveRecord::Migration
  def change
    create_table :group_relations do |t|
	  t.belongs_to  :group
	  t.belongs_to  :user
    t.belongs_to  :project
	  t.datetime :accepted_at
	  t.integer :status, default: 2, null: false
    end
  end
end