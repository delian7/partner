class Group < ActiveRecord::Base

  belongs_to :user
  belongs_to :project
  belongs_to :group, :class_name => "User", :foreign_key => "group_id"   
 # enum status:[ :group_status, :class_name => 'groupStatus', :foreign_key => 'group_status_id']

  validates_presence_of   :user
  validates_presence_of   :group
  validates_uniqueness_of :group_id, :scope => :user_id

  
  private
  def set_pending
    group_status_id = groupStatus[:pending].id
  end  
end
