class VisitorsController < ApplicationController
	helper_method :course_ids, :confirmed, :my_partner_for,:teammates?, :in_group_for?, :classmates?, :same?, :is_student?
	include UsersHelper

	  def index
  	  @users = User.all
  	  if user_signed_in?
   set_current_users_instance_variables
      end


  end
  
end
