class Group < ActiveRecord::Base
has_and_belongs_to_many :courses
has_and_belongs_to_many :users

  # has_many :courses, :through =>:projects
  # has_many :projects
  # has_many :users, :through => :grouprelations
  # has_many :grouprelations

  # validates_presence_of   :user
  # validates_presence_of   :group
  # validates_uniqueness_of :group_id, :scope => :user_id

end