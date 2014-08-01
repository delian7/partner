class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.references   :course, :default=> ""
      t.references   :user, :default=> ""
      t.references   :project, :default=> ""
        t.timestamps
    end
  end
end