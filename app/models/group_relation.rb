class GroupRelation < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  belongs_to :course
  belongs_to :project
end
