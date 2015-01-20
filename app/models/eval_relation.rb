class EvalRelation < ActiveRecord::Base
	belongs_to :user
	belongs_to :evaluation
	belongs_to :project
	belongs_to :group
end
