class VisitorsController < ApplicationController
	include UsersHelper

	  def index
  	  @users = User.all
  	  if user_signed_in?
        @group_names = current_user.groups.collect(&:name)
        @group_ids = current_user.groups.collect(&:id)
        set_current_users_instance_variables
      end
  end
  
end
