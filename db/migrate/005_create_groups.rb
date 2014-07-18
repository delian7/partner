class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string   :partner1, :default=> ""
      t.string   :partner2, :default=> ""
      t.string   :partner3, :default=> ""
      t.string   :partner4, :default=> ""
      t.string   :partner5, :default=> ""
      t.string   :partner6, :default=> ""
      t.boolean  :initiator, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end
