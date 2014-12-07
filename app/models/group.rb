class Group < ActiveRecord::Base
  has_one :course, :through =>:group_relations
  has_one :projects, :through=> :group_relations
  has_many :users, :through => :group_relations
  belongs_to :course
  belongs_to :project
  belongs_to :user
  has_many :group_relations
end