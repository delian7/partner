class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :limit
      t.boolean :allow_repeat
      t.timestamps
    end
  end
end