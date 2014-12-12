class EvalRelations < ActiveRecord::Base
	belongs_to :user
	belongs_to :evaluation
	belongs_to :project
end
