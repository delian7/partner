class ProjectRelationsController < ApplicationController
  include UsersHelper
  helper_method :course_ids, :requested?, :requester?, :my_partner_for,:teammates?, :in_project_for?, :classmates?, :same?, :is_student?, :user_netid
  before_filter :authenticate_user!
  # after_action :verify_authorized
  require 'csv'
   
  def index
    # @user = User.find(params[:id])
    set_current_users_instance_variables
    
    if @myproject.nil?
      set_current_project_course(current_user, Project.find(0), Course.find(0))
    end
      # @allowed_project_size = @myproject.project_size
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    @project.save
    redirect_to(:action => 'index')
  end

  def update
    @project = ProjectRelation.find(params[:id])
    
    if @project.update_attributes(project_params)
      flash[:notice] = "Project updated successfully"
      redirect_to(:action => 'index')
    else
      flash[:error] = "Project could not be updated"
      render('edit')
    end
  end


  def update
    authorize current_user
    Project.find(ProjectRelation.find(params[:id]).project_id).name
    if ProjectRelation.update_attributes(secure_params)
      redirect_to :back, :notice => "User updated."
    else
      redirect_to :back, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
  end

  private
  def secure_params
    params.require(:projectrelation).permit(:id, :course_id, :project_id)
  end
end