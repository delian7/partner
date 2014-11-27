class GroupsController < ApplicationController
  include UsersHelper, GroupsHelper
  helper_method :course_ids, :requested?, :requester?, :my_partner_for,:teammates?, :in_group_for?, :classmates?, :same?, :is_student?, :get_status
  before_filter :authenticate_user!
  # after_action :verify_authorized
  require 'csv'
   
  def index
    set_current_users_instance_variables
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
    user = User.find_by_id(params[:id])
    if !params[:id].nil?
      newgroup = Group.find_by(params[:group][:name])
      relation = GroupRelation.find_by(group_id: params[:group][:name], user_id: params[:id])
      relation.group_id = newgroup
      if GroupRelation.find_by(group_id: params[:id]).nil?
        Group.find(params[:group][:name]).destroy
      end
    else
    relation = GroupRelation.create(group_id: Group.find(params[:group][:name]), user_id: params[:id])
    end
    if relation.save
      redirect_to :back, :notice => "<b>#{User.find(params[:id]).first_name} #{User.find(params[:id]).last_name}</b> moved to <b>#{Group.find(params[:group][:name]).name}</b>"
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
  
  def leave
    group = Group.find(params[:id])
    authorize current_user
    set_current_users_instance_variables
    if !group.nil?
          if group.group_relations.where(status: 2).size <= 2
            # Delete the group
            group.destroy
            # Delete relation for current user
            group.group_relations.each { |relation| relation.destroy }
          else
            current_user.group_relations.find_by(group_id: group.id).destroy
          end
      # Delete relation for user
      flash[:notice] = "Group Relation successfully reset." 
    else 
      flash[:error] = "Unable to reset Group Relation." 
    end
    redirect_to :back
  end

   def confirm
    group = Group.find(params[:id])
    authorize current_user
    allowed_group_size = Project.find_by_id(current_user.current_project).group_size
    
    if allowed_group_size >= 2
      requested = GroupRelation.find_by(user_id: current_user.id, group_id: group.id)
      requested.status = 2
      redirect_to :back
      requested.save ? flash[:notice] = "You are now in group: <b>#{group.name}</b>"  : flash[:notice] = "There was a problem, try again" 
    else
        redirect_to :back, flash[:error] = "Your Professor specified this project is an individual task. If this is incorrect, please contact your professor." 
    end
  end

    def request_join
      group = Group.find(params[:id])
      authorize current_user
      set_current_users_instance_variables
      allowed_group_size = Project.find_by_id(current_user.current_project).group_size
    
    if allowed_group_size <= group.users.size
          #create relation for current user
          current_user_relation = GroupRelation.create(course_id: @mycourse.id, user_id: current_user.id, 
          project_id: @myproject.id, status: 1, group_id: group.id)
      flash[:notice] = "Sent request to join <b>#{group.name}</b> "
    else 
      flash[:error] = "<b>#{group.name}</b> is full"
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

    def disband
    group = Group.find(params[:id])
    groupname = group.name
    authorize current_user
    set_current_users_instance_variables
    
      group.group_relations.each do |relation|
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