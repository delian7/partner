class CreateEvalRelations < ActiveRecord::Migration
  def change
    create_table :eval_relations do |t|

      t.timestamps
    end
  end
end
