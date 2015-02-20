class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.belongs_to  :course
      t.belongs_to  :user
    end
  end
end
