class Group < ActiveRecord::Base
  has_one :course, :through =>:group_relations
  has_one :project, :through=> :group_relations
  has_many :users, :through => :group_relations
  belongs_to :course
  has_many :group_relations
end