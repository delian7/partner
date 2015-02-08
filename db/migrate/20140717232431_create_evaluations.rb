class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.integer :effort
      t.integer :quality
      t.integer :reliability
      t.boolean :flag
      t.string :comments
      t.timestamps
    end
  end
end
