class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.belongs_to   :project, default: ""
      t.belongs_to   :user, default: ""
      	t.timestamps
    end
  end
end
