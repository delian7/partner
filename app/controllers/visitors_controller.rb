class VisitorsController < ApplicationController
  def index
  	  @users = User.all
  	  # @list = Roster.where(:user_id=>current_user.id)
  	  if user_signed_in?
        @list = current_user.groups.all
  	    #@list = Roster.where(:user_id=>current_user.id)
      end
  	  # @enrolled = @enrolled.collect(&:id)
	  #@user = User.find(params[:id])
	  authorize @users
  end
  
end
