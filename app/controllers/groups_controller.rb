class GroupsController < ApplicationController
  include UsersHelper
  helper_method :course_ids, :requested?, :requester?, :my_partner_for,:teammates?, :in_group_for?, :classmates?, :same?, :is_student?, :user_netid
  before_filter :authenticate_user!
  # after_action :verify_authorized
  require 'csv'
   
  def index
    # @user = User.find(params[:id])
    set_current_users_instance_variables
    
    if @myproject.nil?
      set_current_project_course(current_user, Project.find(0), Course.find(0))
    end
      # @allowed_project_size = @myproject.group_size
  end

  def edit
    @group = Group.find(params[:id])
  end
  
  
  def create
    if !params[:group][:name].nil?
      @group = Group.create(name: params[:group][:name], course_id: current_user.current_course, project_id: current_user.current_project)
    end
    @group.save
    redirect_to(:action => 'index')
  end
  
  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    @group.save
    redirect_to(:action => 'index')
  end

  def update_relation  
    newgroup = params[:group][:name]
    user = params[:user]
    if !params[:id].nil?
    relation = GroupRelation.find_by(group_id: params[:id], user_id: user)
    relation.group_id = newgroup
      if GroupRelation.find_by(group_id: params[:id]).nil?
        Group.find(params[:id]).destroy
      end
  else
    relation = GroupRelation.create(group_id: params[:group][:name], user_id: params[:id])
    end
    if relation.save
      redirect_to :back, :notice => "<b>#{User.find(params[:user]).first_name} #{User.find(params[:user]).last_name}</b> moved to <b>#{Group.find(params[:group][:name]).name}</b>"
    else
      redirect_to :back, :alert => "Unable to change group."
    end
  end

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(group_params)
      flash[:notice] = "Group updated successfully"
      redirect_to(:action => 'index')
    else
      flash[:error] = "Group could not be updated"
      render('edit')
    end
  end

  def remove
    @group = Group.find(params[:id])
    @group.destroy
    if @group.save
      flash[:notice] = "Group Deleted"
    else
      flash[:error] = "Group could not be deleted"
    end
    redirect_to(:action => 'index')
  end
  
  def profile
    set_current_users_instance_variables
    if user_signed_in?
    authorize current_user
    else
    redirect_to :back, :alert => "Access denied."
    end
  end

  def show
    @group = Group.find(params[:id])
    authorize current_user

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
  

  def confirm
    group = Group.find(params[:id])
    authorize current_user
    allowed_group_size = Project.find_by_id(current_user.current_project).group_size
    
    if allowed_group_size >= 2
      requested = GroupRelation.find_by(user_id: current_user.id, group_id: group.id)
      requested.status = 2
    if requested.save
      redirect_to users_path(@current_group), flash: { :notice => "You are now in group: <b>#{group.name}</b>" }
    else
      redirect_to users_path(@current_group), flash: { :error => "There was a problem, try again" }
    end
    else
      flash[:notice] = "Your Professor specified this project is an individual task. If this is incorrect, please contact your professor. "
      redirect_to users_path
    end
  end
  
  def leave
    @mygroup = Group.find(params[:id])
    authorize current_user
    set_current_users_instance_variables
    if !@mygroup.nil?
    if GroupRelation.where(group_id: @mygroup.id).size <= 2
    # Delete the group
    @mygroup.destroy
    # Delete relation for current user
    GroupRelation.where(user_id: requester?(user).id, group_id: @mygroup.id, status: 2).first.destroy
    end
    # Delete relation for user
    flash[:notice] = "Ignored Request."
    else 
    flash[:error] = "Unable to ignore request."
    end
    GroupRelation.where(user_id: requested?(user).id, group_id: @mygroup.id, status: 0).first.destroy
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


  def delete_partnership
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
  redirect_to groups_path
  end

    def disband
    group = Group.find(params[:id])
    groupname = group.name
    authorize current_user
    set_current_users_instance_variables
    
      GroupRelation.where(group_id: group.id).each do |relation|
      relation.destroy
    end
    if group.destroy
       flash[:notice] = "#{groupname} has been disbanded."
     else
      flash[:error] = "Unable to disband #{groupname}."
    end
  redirect_to groups_path
  end



  private

  def group_params
    params.require(:group).permit(:name, :project_id)
  end
end