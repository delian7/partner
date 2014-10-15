class VisitorsController < ApplicationController
  def index
  	  @users = User.all
  	  # @list = Roster.where(:user_id=>current_user.id)
  	  @list = current_user.groups.all
  	  #@list = Roster.where(:user_id=>current_user.id)
  	  # @enrolled = @enrolled.collect(&:id)
	  #@user = User.find(params[:id])
	  authorize @users
  end
end
