class UsersController < ApplicationController
  before_filter :authenticate_user!
  #after_action :verify_authorized, except: [:show]
require 'csv'

def index
  @users = User.all
  #@user = User.find(params[:id])
  authorize @users
end

def show
  @user = User.find(params[:id])
  unless user_signed_in?
# unless @user == current_user
  redirect_to :back, :alert => "Access denied."
  end
end

def update
  @user = User.find(params[:id])
  authorize @user
  if @user.update_attributes(secure_params)
    redirect_to users_path, :notice => "User updated."
  else
    redirect_to users_path, :alert => "Unable to update user."
  end
end

def destroy
  user = User.find(params[:id])
  authorize user
  unless user == current_user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  else
    redirect_to users_path, :notice => "Can't delete yourself."
  end
end


def flop
  user = User.find(params[:id])

  user.status = !user.status # flop the status
  current_user.status = !current_user.status

  if current_user.partner1 == ""

<<<<<<< HEAD
    if current_user.partner1 == ""
      current_user.partner1 = user.name
      user.partner1 = current_user.name
    else
      current_user.partner1 = ""
      user.partner1 = ""
    end
=======
    current_user.partner1 = user.name
    user.partner1 = current_user.name
  else

    current_user.partner1 = ""
    user.partner1 = ""
  end
>>>>>>> FETCH_HEAD

    user.save
    current_user.save
    redirect_to users_path(current_user)
end


def cancel
  user = User.find(params[:id])

  user.status = false
  current_user.status = false
  current_user.partner1 = ""
  user.partner1 = ""

  user.save
  current_user.save
  redirect_to registration_path(user)
  current_user.destroy

end


def clearall
  User.all.each do |user|
  user = User.find(user)
  user.status = false
  user.partner1 = ""
  user.save
end
  redirect_to users_path(current_user), :alert => "All Partnerships have been cleared."
end

def export
    @roster = User.all
    roster_csv = CSV.generate do |csv|
    csv << ["Name", "Partner"]
    User.all.each do |user|
      csv << [user.name, user.partner1]     
    end 
    end    
  send_data(roster_csv, :type => 'text/csv', :filename => 'partnerships.csv')
end


  private
  def secure_params
    params.require(:user).permit(:role)
  end

end
