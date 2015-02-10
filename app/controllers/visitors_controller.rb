class VisitorsController < ApplicationController
  helper_method :teammates?, :in_group_for?, :classmates?
  include UsersHelper

  def index
    @users = User.all
    if user_signed_in?
      set_current_users_instance_variables
    end
  end
end
