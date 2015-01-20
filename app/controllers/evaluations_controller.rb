class EvaluationsController < ApplicationController
  include EvaluationsHelper, UsersHelper, ParsingHelper
  before_filter :authenticate_user!

  def index
  authorize current_user
  set_current_users_instance_variables
  end

  def new
  authorize current_user
  set_current_users_instance_variables
  end

  def edit
    @evaluation = Evaluation.find(params[:id])
  end

 def profile
    authorize current_user
  end

  def show
    @evaluation = Evaluation.find(params[:id])
    unless user_signed_in?
    authorize current_user
    redirect_to :back, :alert => "Access denied."
    end
  end

  def update
    authorize current_user
    @evaluation = Evaluation.find(params[:id])
    if @evaluation.update_attributes(evaluation_params)
      redirect_to :back, :notice => "Evaluation updated successfully"
    else
      redirect_to :back, :alert => "Evaluation could not be updated"
    end
  end


  def remove
    authorize current_user
    if Evaluation.find_by_id(params[:id]) != nil
    @evaluation = Evaluation.find(params[:id])
        @evaluation.users.each do |user|
        set_current_project_evaluation(user, Project.find_by_id(0), Evaluation.find_by_id(0))
        end
    destroy_roster_relations(@evaluation)
    destroy_project_relations(@evaluation)
    @evaluation.destroy
    @evaluation.save ? flash[:notice] = "Success!  Evaluation has been deleted" : flash[:error] = "Evaluation could not be deleted"
    redirect_to(:action => 'index')
    end
  end

def destroy
  authorize current_user
  if Evaluation.find_by_id(params[:id]) != nil
  @evaluation = Evaluation.find(params[:id])
      @evaluation.users.each do |user|
      set_current_project_evaluation(user, Project.find_by_id(0), Evaluation.find_by_id(0))
      end
  destroy_roster_relations(@evaluation)
  destroy_project_relations(@evaluation)
  @evaluation.destroy
  @evaluation.save ? flash[:notice] = "Success!  Evaluation has been deleted" : flash[:error] = "Evaluation could not be deleted"
  redirect_to(:action => 'index')
  end
end

  
private 
  
  def evaluation_params
    params.require(:evaluation).permit(:evaluation_title, :group_id, :user_id, :user_id, :instructor, :id, :field1, :field2, :field3)
  end 

end
