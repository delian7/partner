class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|

      t.boolean  :taken, :default => 0
      t.string   :question1, :default=> ""
      t.string   :question2, :default=> ""
      t.string   :question3, :default=> ""
      t.string   :question4, :default=> ""
      t.string   :question5, :default=> ""
      t.string   :question6, :default=> ""

      t.timestamps
    end
  end
end
