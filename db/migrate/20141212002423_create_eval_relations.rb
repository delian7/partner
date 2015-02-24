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
  
      user = User.create!( first_name: 'David', last_name: 'Kay', ucinetid: 'kay', role: 1)
end
