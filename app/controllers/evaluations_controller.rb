class EvaluationsController < ApplicationController
  include EvaluationsHelper, UsersHelper, ParsingHelper
  # before_filter :authenticate_user!

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

  def create
    @evaluation = Evaluation.new(evaluation_params)
    set_current_users_instance_variables
    if @evaluation.save
      current_user.save
      relation = EvalRelation.create(user_id: params[:evaluation][:user], reviewer_id: current_user.id, group_id: @mygroup.id, evaluation_id: @evaluation.id, project_id: current_user.current_project)
      relation.save
      redirect_to :back, notice: "Evaluation saved successfully"
    else
      redirect_to :back, alert: "Evaluation could not be saved"
    end
  end
  
  def update
    authorize current_user
    @evaluation = Evaluation.find(params[:id])
    if @evaluation.update_attributes(evaluation_params)
      redirect_to :back, notice: "Evaluation updated successfully"
    else
      redirect_to :back, alert: "Evaluation could not be updated"
    end
  end

  private

  def evaluation_params
    params.require(:evaluation).permit(:evaluation_title, :group_id, :user_id, :user_id, :instructor, :id, :field1, :field2, :field3)
  end
end