class VisitorsController < ApplicationController
  helper_method :teammates?, :in_group_for?, :classmates?
  include UsersHelper

  def index
    @users = User.all
    if user_signed_in?
      set_current_users_instance_variables
    
	# current_user.groups.order(:project_id).uniq.each do |group| 
	# 	@is_current_user_requested = (group.group_relations.find_by(user_id: current_user.id, group_id: group.id).status == 1) if group.group_relations.find_by(user_id: current_user.id, group_id: group.id) 
	#  	@is_current_user_confirmed = (group.group_relations.find_by(user_id: current_user.id, group_id: group.id).status == 2) 
	#  	@are_there_any_users_sending_requests = (group.group_relations.find_by(status: 0) != nil) 
	# end 
end
 end
end
