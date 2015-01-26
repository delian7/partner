class Group < ActiveRecord::Base
  has_one :course, :through =>:group_relations
  has_one :project, :through=> :group_relations
  has_many :users, :through => :group_relations
  belongs_to :course
  belongs_to :project
  belongs_to :user
  has_many :group_relations
  has_many :evaluations, :through => :eval_relations
  belongs_to :evaluation
  has_many :eval_relations
end