class Course < ActiveRecord::Base
  has_many :users, :through => :rosters
  has_many :groups, :through => :projects
  has_many :rosters
  has_many :group_relations
  has_many :project_relations
  has_many :projects, :through => :project_relations
end
