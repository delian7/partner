class ProjectRelationsController < ApplicationController
 before_filter :authenticate_user!
  # after_action :verify_authorized

  def index
    authorize current_user
  end

  def create
    authorize current_user
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
    authorize user
  end

  private
  def secure_params
    params.require(:projectrelation).permit(:id, :course_id, :project_id)
  end
end