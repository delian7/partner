class Project < ActiveRecord::Base
   has_many :groups, :through => :group_relations
   has_many :evaluations, :through => :eval_relations
   belongs_to :evaluation
   has_many :eval_relations
   belongs_to :user
   has_many :users, :through => :group_relations
   has_many :group_relations
   has_many :project_relations
   belongs_to :group
   has_many :courses, :through => :project_relations
   belongs_to :course
end
