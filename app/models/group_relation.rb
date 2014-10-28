class GroupRelation < ActiveRecord::Base
	belongs_to :group
	belongs_to :user
	belongs_to :course
<<<<<<< HEAD
	belongs_to :project
=======
  belongs_to :project
>>>>>>> adding-groups
end
