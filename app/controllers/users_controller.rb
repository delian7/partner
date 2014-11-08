class UsersController < ApplicationController
  include UsersHelper
  helper_method :course_ids, :requested?, :requester?, :teammates?, :in_group?, :classmates?, :same?, :is_student?
  before_filter :authenticate_user!
  # after_action :verify_authorized, except: [:show, :index]
  require 'csv'
   
  def index
    # @user = User.find(params[:id])
    @users = User.all
    @mycourse = current_user.current_course 
    @myproject = current_user.current_project
    @mygroup = GroupRelation.where(:project_id => @myproject, :user_id => current_user.id).pluck(:group_id)
    @current_projects = Project.where(course_id: current_user.current_course, active: true)
    
    if @myproject.nil? || Project.find_by_id(@myproject).nil?
      set_current_project_course(current_user, Project.find(0), Course.find(0))
    end
      @allowed_project_size = Project.find_by_id(current_user.current_project).group_size
  end

  def new
    @partners = User.find(params[:id])
    @users = User.all
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
    authorize User.find(params[:id])
    set_current_users_instance_variables
    current_user.update_attributes(secure_params)
    
    if @current_projects.exists?
      current_user.update_attributes(:current_project => @current_projects.first.id)
    end
    redirect_to users_path
      
  end
  
  def set_current_project
    authorize User.find(params[:id])
    current_user.update_attributes(secure_params)
    redirect_to users_path
  end

  # Start download of csv file of partner data
  def export_csv
      authorize User.all
      roster_csv = CSV.generate do |csv|
      csv << ["First Name", "Last Name", "Email"]
      User.where(role: 0).each do |user|
        csv << [user.first_name, user.last_name, user.email]     
      end 
      end    
    send_data(roster_csv, :type => 'text/csv', :filename => 'groups.csv')
  end

  def send_request
    user = User.find(params[:id])
    authorize user
    allowed_group_size = Project.find_by_id(current_user.current_project).group_size
    my_current_group_size = GroupRelation.where(project_id: current_user.current_project, course_id: current_user.current_course, group_id: @mygroup).uniq.pluck(:user_id).size
    
    if my_current_group_size >= allowed_group_size
      flash[:error] = "Unable to send request, you have too many pending requests."
    elsif allowed_group_size == 2
      request_partner(user)
    elsif allowed_group_size >= 2
      request_group_member(user)
    else
      flash[:notice] = "Your Professor specified this project is an individual task. If this is incorrect, please contact your professor. "
    end
    redirect_to users_path
  end

   def undo_request
    user = User.find(params[:id])
    authorize user
   set_current_users_instance_variables
    current_group_size = GroupRelation.where(group_id: @mygroup).size
    GroupRelation.where(:project_id => @myproject, :user_id => user.id, :group_id=>@mygroup, status: 1).first.destroy
    # Delete relation for user

    if current_group_size <= 2
    # Delete the group
    Group.find_by_id(@mygroup).destroy
    # Delete relation for current user
    GroupRelation.where(:project_id => @myproject, :user_id => current_user.id, :group_id=>@mygroup, status: 0).first.destroy
    end
    flash[:error] = "Successfully removed request"
  redirect_to users_path
  end

  def confirm
    user = User.find(params[:id])
    authorize user
    allowed_group_size = Project.find_by_id(current_user.current_project).group_size
    my_current_group_size = GroupRelation.where(project_id: current_user.current_project, course_id: current_user.current_course, group_id: @mygroup).uniq.pluck(:user_id).size
    
    if 5000 >= allowed_group_size
        flash[:error] = "Unable to send request, you have too many pending requests."
        redirect_to users_path
    elsif allowed_group_size == 2
      confirm_partner(user)
    elsif allowed_group_size >= 2
      confirm_group_member(user)
    flash[:notice] = "Your Professor specified this project is an individual task. If this is incorrect, please contact your professor. "
       redirect_to users_path
    else
    end
  end
  
  def ignore
    user =User.find(params[:id])
    authorize user

    if GroupRelation.where(:group_id=>@mygroup).collect(&:id).size <= 2
    # Delete the group
    Group.find_by_id(@mygroup).destroy
    # Delete relation for current user
    GroupRelation.where(:project_id => @myproject, :user_id => requester?(user).id, :group_id=>@mygroup, status: 0).first.destroy
    
  
    # Delete relation for user
    flash[:notice] = "Removed request."
    else 
    flash[:error] = "Unable to remove request."
    end
    GroupRelation.where(:project_id => @myproject, :user_id => requested?(user).id, :group_id=>@mygroup, status: 1).first.destroy
    redirect_to users_path
  end

  def delete_partnership
    user =User.find(params[:id])
    authorize user

    if GroupRelation.where(:group_id=>@mygroup).size == 1 || 2
    # Delete the group
    Group.find_by_id(@mygroup).destroy
    # Delete relation for current user and user
    GroupRelation.where(:project_id => @myproject, :user_id => current_user.id, :group_id=>@mygroup).first.destroy
    GroupRelation.where(:project_id => @myproject, :user_id => user.id, :group_id=>@mygroup).first.destroy
    # Delete relation for user
    flash[:notice] = "Removed User."
    else 
    flash[:error] = "Unable to remove user."
    end
  redirect_to users_path
  end


  private
  def login_params
    params.require(:user).permit(:id)
  end
  def secure_params
    params.require(:user).permit(:id, :name, :ucinetid, :role, :current_course, :current_project)
  end
end
