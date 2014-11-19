class CreateProjectRelations < ActiveRecord::Migration
  def change
    create_table :project_relations do |t|
    t.belongs_to  :project
    t.belongs_to  :course
    end
  end
end
