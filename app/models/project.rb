class Project < ActiveRecord::Base
  has_many :groups, :through => :group_relations
  has_many :users, :through => :group_relations
  has_many :evaluations, :through => :eval_relations
  has_many :courses, :through => :project_relations
  belongs_to :evaluation
  belongs_to :user
  belongs_to :group
  belongs_to :course
  has_many :group_relations
  has_many :project_relations
  has_many :eval_relations
end
