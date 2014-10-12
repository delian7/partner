class CreateGrouprelations < ActiveRecord::Migration
  def change
    create_table :grouprelations do |t|
	  t.belongs_to  :group
	  t.belongs_to  :user
    	t.timestamps
    end
  end
end
