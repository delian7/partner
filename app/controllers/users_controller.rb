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

  def set_current_course
    authorize User.find(params[:id])
    current_user.update_attributes(secure_params)
    set_current_users_instance_variables
    @current_projects = Project.where(course_id: @mycourse.id, active: true)

    if @current_projects.exists?
      current_user.update_attributes(current_project: @current_projects.first.id)
    else
      current_user.update_attributes(current_project: 0)
    end
    redirect_to :back
     
  end
  
  def set_current_project
    user = User.find(params[:id])
    authorize user
    current_user.update_attributes(secure_params)
    redirect_to :back
  end

  # Start download of csv file of partner data
  def export_csv
      user = current_user
      authorize user
      roster_csv = CSV.generate do |csv|
      csv << ["Group", "First Name", "Last Name", "Email", "confirmed"]
    @members=[]
    groupids = GroupRelation.where(project_id:current_user.current_project).collect(&:group_id).uniq
    groupids.each do |group|
    @group = Group.find(group)

    GroupRelation.where(group_id: group).collect(&:user_id).each do |i|
    name = "#{user.first_name} #{user.last_name}"
    user = User.find(i)

    if GroupRelation.find_by(user_id: user.id, group_id: @group.id).nil?
        @confirmed ="Request Pending"
    elsif GroupRelation.find_by(user_id: user.id, group_id: @group.id).status == 2
        @confirmed = "Confirmed"
    else
        @confirmed ="Request Pending"
    end 
    csv << [@group.name, user.first_name, user.last_name, user.email, @confirmed]   
       end 
      end    
    end
    send_data(roster_csv, :type =>  'text/csv', :filename =>  'groups.csv')
  end

  def leave
    user = User.find(params[:id])
    authorize user
    set_current_users_instance_variables
    if !@mygroup.nil?
          if GroupRelation.where(group_id: @mygroup.id).size <= 2
            # Delete the group
            @mygroup.destroy
            # Delete relation for current user
            GroupRelation.where(user_id: user.id, group_id: @mygroup.id).first.destroy
          end
      GroupRelation.where(user_id: current_user.id, group_id: @mygroup.id).first.destroy
      # Delete relation for user
      flash[:notice] = "Ignored Request."
      redirect_to users_path
    else 
      flash[:error] = "Unable to ignore request."
      redirect_to users_path
    end
  end

  private

  def admin_only
    unless current_user.role == 3
      redirect_to :back, :alert => "Access denied."
    end
  end
  def secure_params
    params.require(:user).permit(:id, :avatar, :description, :availability, :role, :current_course, :current_project)
  end
end