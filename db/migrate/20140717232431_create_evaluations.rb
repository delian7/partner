class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.belongs_to :project, :default=> ""
      t.belongs_to :group, :default=> ""
      t.references   :user, :default=> ""
      t.boolean  :taken, :default => 0

      t.timestamps
    end
  end
end
