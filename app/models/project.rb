class Project < ActiveRecord::Base
   has_many :groups
   has_many :evaluations
   has_many :group_relations
   belongs_to :group
   has_many :courses, :through => :group_relations, :source => :course
end
