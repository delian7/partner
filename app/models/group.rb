class Group < ActiveRecord::Base
  has_one :course, :through =>:group_relations
  has_one :project, :through=> :group_relations
  has_many :users, :through => :group_relations
  #belongs_to :course
  has_many :group_relations
  # enum status:[ :group_status, :class_name => 'groupStatus', :foreign_key => 'group_status_id']

  validates_presence_of   :user
  validates_presence_of   :group
  validates_uniqueness_of :group_id, :scope => :user_id


  private
  def set_pending
    group_status_id = groupStatus[:pending].id
  end  
end