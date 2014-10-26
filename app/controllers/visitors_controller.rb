class VisitorsController < ApplicationController
  def index
  	  @users = User.all
  	  if user_signed_in?
        @group_names = current_user.groups.collect(&:name)
        @group_ids = current_user.groups.collect(&:id)
      end
	  authorize @users
  end
end
