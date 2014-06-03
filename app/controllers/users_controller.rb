class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  unless user_signed_in?
  #  unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def flop
    user = User.find(params[:id])
    user.status = !user.status # flop the status
    current_user.status = !current_user.status

    if current_user.partner1 == ""
    current_user.partner1 = user.name
    user.partner1 = current_user.name
    else
    current_user.partner1 = ""
    user.partner1 = ""
    end

    user.save
    current_user.save
    redirect_to users_path(user)
end




end