class VisitorsController < ApplicationController
	helper_method :course_ids, :confirmed, :my_partner_for,:teammates?, :in_group_for?, :classmates?, :same?, :is_student?
	include UsersHelper

	  def index
  	  @users = User.all
  	  if user_signed_in?
	   @confirmed_groupids = current_user.group_relations.where(status:2).collect(&:group_id)
	   @confirmed_groups = []
	   @confirmed_groupids.each {|group| @confirmed_groups.push(Group.find_by_id(group))}
        set_current_users_instance_variables
      end
  end
  
end
