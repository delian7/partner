class UsersController < ApplicationController
  before_filter :authenticate_user!
  # before_filter :admin_only, :except => :show
  helper_method :course_ids, :requested?, :my_partner_for, :requester?, :teammates?, :in_group_for?, :classmates?, :same?, :is_student?, :user_netid
  include UsersHelper
  # after_action :verify_authorized, except: [:show, :index]
  require 'csv'
   


  def index
    # @user = User.find(params[:id])
    @users = User.all
    set_current_users_instance_variables
    
    if @myproject.nil?
      set_current_project_course(current_user, Project.find(0), Course.find(0))
    end
  end

  def show
    @user = User.find(params[:id])
    # unless current_user.role == 3
    #   unless @user == current_user
    #     redirect_to :back, :alert => "Access denied."
    #   end
    # end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  # def new
  #   user = User.find(params[:id])
  #   authorize user
  # end

  def set_current_course
    authorize User.find(params[:id])
    set_current_users_instance_variables
    current_user.update_attributes(secure_params)
    
    if @current_projects.exists?
      current_user.update_attributes(current_project: @current_projects.first.id)
    end
    redirect_to users_path
      
  end
  
  def set_current_project
    user = User.find(params[:id])
    authorize user
    current_user.update_attributes(secure_params)
    redirect_to users_path
  end

  # Start download of csv file of partner data
  def export_csv
      user = User.find(params[:id])
      authorize user
      roster_csv = CSV.generate do |csv|
      csv << ["First Name", "Last Name", "Email"]
      User.where(role: 0).each do |user|
        csv << [user.first_name, user.last_name, user.email]     
      end 
      end    
    send_data(roster_csv, :type =>  'text/csv', :filename =>  'groups.csv')
  end

  def send_request
    user = User.find(params[:id])
    authorize user
    set_current_users_instance_variables
   
    if @current_group_size >= @allowed_group_size
      flash[:error] = "Unable to send request, you have too many pending requests."
    elsif @allowed_group_size >= 2
      request_group_member(user)
    else
      flash[:notice] = "Your Professor specified this project is an individual task. If this is incorrect, please contact your professor. "
    end
    redirect_to users_path
  end

  def confirm
    user = User.find(params[:id])
    authorize user
    set_current_users_instance_variables
    allowed_group_size = Project.find_by_id(current_user.current_project).group_size
    
    if allowed_group_size == 2
      confirm_partner(user)
    elsif allowed_group_size >= 2
      confirm_group_member(user)
    else
    flash[:notice] = "Your Professor specified this project is an individual task. If this is incorrect, please contact your professor. "
       redirect_to users_path
    end
  end
  
  def ignore
    user = User.find(params[:id])
    authorize user
    set_current_users_instance_variables
    if !@mygroup.nil?
    if GroupRelation.where(group_id: @mygroup.id).size <= 2
    # Delete the group
    @mygroup.destroy
    # Delete relation for current user
    GroupRelation.where(user_id: requester?(user).id, group_id: @mygroup.id, status: 2).first.destroy
    
  
    # Delete relation for user
    flash[:notice] = "Removed request."
    else 
    flash[:error] = "Unable to remove request."
    end
    GroupRelation.where(user_id: requested?(user).id, group_id: @mygroup.id, status: 0).first.destroy
  end
    redirect_to users_path
  end

  def leave_group
    user = User.find(params[:id])
    authorize user
    set_current_users_instance_variables
    if !@mygroup.nil?
      if @current_group_size <= 2
        # Delete the group
        @mygroup.destroy
        # Delete relation for current user and user
        GroupRelation.find_by(user_id: current_user.id, group_id: @mygroup.id).destroy
        # Delete relation for user
      end
      GroupRelation.find_by(user_id: user.id, group_id: @mygroup.id).destroy
      flash[:notice] = "Removed User."
    else 
      flash[:error] = "Unable to remove user."
    end
  redirect_to users_path
  end

     def undo_request
    user = User.find(params[:id])
    authorize user
    set_current_users_instance_variables
    if !@mygroup.nil?
    GroupRelation.where(project_id: @myproject.id, user_id: user.id, group_id: @mygroup.id, status: 1).first.destroy
    # Delete relation for user
    
    if @current_group_size <= 2
    # Delete the group
    @mygroup.destroy
    # Delete relation for current user
    GroupRelation.where(project_id: @myproject.id, user_id: current_user.id, group_id: @mygroup.id, status: 2).first.destroy
    end
    flash[:error] = "Successfully removed request"
    end
  redirect_to users_path
  end


  private

  def admin_only
    unless current_user.role == 3
      redirect_to :back, :alert => "Access denied."
    end
  end
  # def login_params
  #   params.require(:user).permit(:id)
  # end
  def secure_params
    params.require(:user).permit(:id, :avatar, :name, :ucinetid, :role, :current_course, :current_project)
  end
end