class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.boolean  :title, :default => 0


      t.timestamps
    end
  end
end
