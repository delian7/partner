class UsersController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized, except: [:show, :index]
  require 'csv'

  def index
    @users = User.all
    @courses = Course.all
    @groups = Group.all
    #@user = User.find(params[:id])
    authorize @users
  end
  def new
    @partners = User.find(params[:id])
    @users = User.all
    #@user = User.find(params[:id])
    authorize @users
  end
  def show
    @user = User.find(params[:id])
    if user_signed_in?
    authorize @user
    else
    redirect_to :back, :alert => "Access denied."
    end
  end

  def profile
    if user_signed_in?
    authorize current_user
    else
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
  
  def set_current_course
    user = User.find(params[:id])
    authorize user
    current_user.update_attributes(secure_params)
    redirect_to groups_path
  end

  def add_partnership
    authorize current_user
    user = User.find(params[:id])
    #current_group = GroupRelation.find
    
    group = GroupRelation.references(:group_relation).where(:user_id => user)

    relation1 = GroupRelation.create(:user_id=>user.id)
    relation2 = GroupRelation.create(:user_id=>current_user.id)
    if relation1.save && relation2.save
      flash[:notice] = "Added partner."
      redirect_to :back
    else
      flash[:error] = "Unable to add partner."
      redirect_to :back
    end
  end

  # Start download of csv file of partner data
  def export
      authorize User.all
      @roster = User.all
      roster_csv = CSV.generate do |csv|
      csv << ["First Name", "Last Name", "Email"]
      User.where(role: 0).each do |user|
        csv << [user.first_name, user.last_name, user.email]     
      end 
      end    
    send_data(roster_csv, :type => 'text/csv', :filename => 'groups.csv')
  end

  def add_to_group
    authorize current_user
    user = User.find(params[:id])
    #current_group = GroupRelation.find
    group = GroupRelation.references(:group_relation).where(:user_id => user)
    new_relation = GroupRelation.create(:group_id=>"1", :user_id=>user.id)
    if new_relation.save
      flash[:notice] = "Added partner."
      redirect_to :back
    else
      flash[:error] = "Unable to add partner."
      redirect_to :back
    end
  end

    def create_group
    user = User.find(params[:id])
    @group = Group.create(:group_id=>user.group_id, :user_id=>current_user.id)
    if @group.save
      flash[:notice] = "Added partner."
      redirect_to :back
    else
      flash[:error] = "Unable to add partner."
      redirect_to :back
    end
  end
  
  def ungroup
    @group = current_user.groups.find(params[:id])
    @group.destroy
    flash[:notice] = "Removed group."
    redirect_to current_user
  end

  private
  def login_params
    params.require(:user).permit(:id)
  end
  def secure_params
    params.require(:user).permit(:id, :name, :ucinetid, :role, :current_course)
  end
end
