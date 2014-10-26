class Group < ActiveRecord::Base
  has_one :course, through: :group_relations
  has_one :project, through: :group_relations
  has_many :users, through: :group_relations
  has_many :group_relations

  validates_presence_of :user
  validates_presence_of :group
  validates_uniqueness_of :group_id, scope: :user_id
 
end