class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.belongs_to :group, :default=> ""
      t.references   :course, :default=> ""

      t.timestamps
    end
  end
end
