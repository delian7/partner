class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def flop
    user = User.find(params[:id])
    user.status = !user.status # flop the status
    user.save

    redirect_to users_path(user)
end


end
