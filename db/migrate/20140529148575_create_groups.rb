class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :limit
      t.boolean :allow_repeat
      t.belongs_to :project
      t.belongs_to :course

      t.timestamps
    end
  end
end
