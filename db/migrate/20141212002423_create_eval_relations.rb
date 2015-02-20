class CreateEvalRelations < ActiveRecord::Migration
  def change
    create_table :eval_relations do |t|
      t.belongs_to :user
      t.belongs_to :reviewer
      t.belongs_to :group
      t.belongs_to :project
      t.belongs_to :evaluation
      t.timestamps
    end
  end
end
