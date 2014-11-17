class GroupRelationsController < ApplicationController
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
  
  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    @group.save
    redirect_to(:action => 'index')
  end

  def update
    @group = GroupRelation.find(params[:id])
    
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

  def update
    authorize current_user
    Group.find(GroupRelation.find(params[:id]).group_id).name
    if GroupRelation.update_attributes(secure_params)
      redirect_to :back, :notice => "User updated."
    else
      redirect_to :back, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    unless user == current_user
      user.destroy
      redirect_to :back, :notice => "User deleted."
    else
      redirect_to :back, :notice => "Can't delete yourself."
    end
  end

  private
  def login_params
    params.require(:grouprelation).permit(:id)
  end
  def secure_params
    params.require(:grouprelation).permit(:id, :course_id, :group_id, :projet_id, :user_id)
    params.require(:group).permit(:name)
  end
end