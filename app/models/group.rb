class Group < ActiveRecord::Base

  has_many :courses, :through =>:projects
  has_many :projects
  has_many :users, :through => :grouprelations
  #belongs_to :course
  has_many :grouprelations
  has_many :projects
  # enum status:[ :group_status, :class_name => 'groupStatus', :foreign_key => 'group_status_id']

  validates_presence_of   :user
  validates_presence_of   :group
  validates_uniqueness_of :group_id, :scope => :user_id


  private
  def set_pending
    group_status_id = groupStatus[:pending].id
  end  
end