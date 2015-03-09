class GroupsController < ApplicationController
  include UsersHelper, GroupsHelper
  helper_method :teammates?, :in_group_for?, :classmates?
  # before_filter :authenticate_user!
  # after_action :verify_authorized
  require 'csv'

  def index
    set_current_users_instance_variables
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update_relation
    user = User.find_by_id(params[:id])
    if !params[:group][:old].nil?
      relation = GroupRelation.find_by(project_id: current_user.current_project, user_id: params[:id])
      oldgroup = Group.find_by_id(params[:group][:old])
      newgroup = Group.find_by_id(params[:group][:id])
      relation.group_id = params[:group][:id]
      if relation.save
        if oldgroup.users.empty?
          oldgroup.destroy
        end
        redirect_to :back, :notice => "<b>#{User.find(params[:id]).first_name} #{User.find(params[:id]).last_name}</b> moved to <b>#{newgroup.name}</b>"
      else
        redirect_to :back, :alert => "Unable to change group."
      end

    else
      newgroup = Group.find_by_id(params[:group][:id])
      relation = GroupRelation.create(group_id: newgroup.id, user_id: params[:id], project_id: current_user.current_project)
      if relation.save
        redirect_to :back, :notice => "<b>#{User.find(params[:id]).first_name} #{User.find(params[:id]).last_name}</b> moved to <b>#{newgroup.name}</b>"
      else
        redirect_to :back, :alert => "Unable to change group."
      end
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

  def show
    @group = Group.find(params[:id])
    authorize current_user
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
      group.users.each do |user|
        ChangeMailer.send_change_message(user.email).deliver if user!=current_user
      end
      flash[:notice] = "Group Relation successfully reset."
    else
      flash[:error] = "Unable to reset Group Relation."
    end
    redirect_to :back
  end

  def confirm
    group = Group.find(params[:id])
    authorize current_user
    project = Project.find_by_id(current_user.current_project)
    allowed_group_size = project.group_size

    if GroupRelation.find_by(user_id: current_user.id, group_id: group.id).status == 1
      requested = GroupRelation.find_by(user_id: current_user.id, group_id: group.id)
      requested.status = 2
      redirect_to root_path
      requested.save ? flash[:notice] = "Successfully added to group: <b>#{group.name}</b>"  : flash[:notice] = "There was a problem, try again"

    elsif GroupRelation.find_by(user_id: current_user.id, group_id: group.id).status == 2
      requested = GroupRelation.find_by(group_id: group.id, status:0)
      requested.status = 2

      # "other_requests" are request excluding the one being confirmed (for the same project)
      other_requests = GroupRelation.where(user_id: current_user.id, project_id: project.id) - GroupRelation.where(user_id: current_user.id, group_id: group.id)

      # we want to delete all the "other_requests" since if person confirms group then
      # all the other requests should disappear
      other_requests.each do |other_request|
        other_request.destroy
      end
      redirect_to root_path
      requested.save ? flash[:notice] = "Successfully added to group: <b>#{group.name}</b>"  : flash[:notice] = "There was a problem, try again"
    else
      redirect_to root_path, flash[:error] = "Your Professor specified this project is an individual task. If this is incorrect, please contact your professor."
    end
  end

  def request_join
    group = Group.find(params[:id])
    project = Project.find_by_id(current_user.current_project)
    authorize current_user
    set_current_users_instance_variables
    allowed_group_size = project.group_size
    if !GroupRelation.find_by(group_id:group.id, user_id:current_user.id, status:2).nil?
      flash[:error] = "You are already in a group"
    elsif allowed_group_size >= group.users.size
      #create relation for current user
      current_user_relation = GroupRelation.create(user_id: current_user.id,
                                                   project_id: @myproject.id, status: 0, group_id: group.id)
      flash[:notice] = "Sent request to join <b>#{group.name}</b> "
      group.users.each do |user|
        ChangeMailer.send_change_message(user.email).deliver
      end
    else
      flash[:error] = "<b>#{group.name}</b> is full"
    end
    redirect_to users_path
  end

  def send_request
    user = User.find(params[:id])
    authorize user
    set_current_users_instance_variables

    if @current_group_size >= @allowed_group_size
      flash[:error] = "Unable to send request, you have too many pending requests."
    else
      @allowed_group_size > 2 ? group_namer("random", @myproject) : group_namer("partner", @myproject)
      if @mygroup.nil?
        newgroup = Group.create(name: @groupname, course_id: @mycourse.id, project_id: @myproject.id)
        #create relation for current user
        current_user_relation = GroupRelation.create(user_id: current_user.id, project_id: @myproject.id, status: 2, group_id: newgroup.id)
      else
        newgroup = Group.find_by_id(@mygroup)
      end
      # create relation for user who is being requested (status=1, requested)
      user_relation = GroupRelation.create(user_id: user.id, project_id: @myproject.id, status: 1, group_id: newgroup.id)
      ChangeMailer.send_change_message(user.email).deliver
      flash[:notice] = "Requested <b>#{user.first_name} #{user.last_name}</b> to your group: <b>#{newgroup.name}</b> "
    end
    redirect_to users_path
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
