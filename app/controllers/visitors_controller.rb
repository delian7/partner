class VisitorsController < ApplicationController
  def index
  	  @users = User.all
  	  # @list = Roster.where(:user_id=>current_user.id)
  	  if user_signed_in?
        @group_names = current_user.groups.collect(&:name)
        @group_ids = current_user.groups.collect(&:id)
  	    #@list = Roster.where(:user_id=>current_user.id)
      end
  	  # @enrolled = @enrolled.collect(&:id)
	  #@user = User.find(params[:id])
	  authorize @users
  end
  
end
