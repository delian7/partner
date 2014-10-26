class Course < ActiveRecord::Base
  has_many :users, through: :rosters
  has_many :groups, through: :group_relations
  has_many :rosters
  has_many :group_relations
  has_many :projects, through: :group_relations
end