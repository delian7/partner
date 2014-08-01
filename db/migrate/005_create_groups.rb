class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string   :relation, :default => ""
      t.references   :course, :default=> ""
      t.references   :user, :default=> ""
      t.references   :project, :default=> ""
      t.references   :evaluation, :default=> ""
      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end
