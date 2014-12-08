class Project < ActiveRecord::Base
   has_many :groups, :through => :group_relations
   has_many :evaluations
   belongs_to :user
   has_many :users, :through => :group_relations
   has_many :group_relations
   has_many :project_relations
   belongs_to :group
   has_many :courses, :through => :project_relations
   belongs_to :course
end
