class EvaluationsController < ApplicationController
  include EvaluationsHelper, UsersHelper
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

  def export_evals
    authorize current_user
    mycourse = Course.find_by_id(current_user.current_course)
    myproject= Project.find_by_id(current_user.current_project)
    roster_csv = CSV.generate do |csv|
      header=[]
      header.push()
      csv << ["Project: #{myproject.name}", "Course: #{mycourse.course_title}", "Quarter: #{mycourse.quarter}"]
      csv << ["Instructor: " + mycourse.instructor, "Downloaded by: " + current_user.first_name + " " + current_user.last_name, "Date: #{Time.now.strftime("%m/%d/%Y")}"]
      csv << ["Time: #{Time.now.strftime("%I:%M %p")}", "Total Teams: #{myproject.groups.uniq.size}", "Total Students: #{mycourse.users.where(role:0).size}"]
      csv << ["Student", "Reviewer", "Average", "Effort", "Reliability","Quality", "Comments"]

      myproject.evaluations.each do |eval|
        eval.eval_relations.each do |relation|
          user = User.find_by_id(relation.user_id)
          reviewer = User.find_by_id(relation.reviewer_id)
          csv << [user.first_name + " " + user.last_name, reviewer.first_name + " " + reviewer. last_name, (eval.effort.to_f + eval.reliability.to_f + eval.quality.to_f)/3, eval.effort, eval.reliability, eval.quality, eval.comments]
        end 
      end
    end
    send_data(roster_csv, type:  'text/csv', filename: "#{mycourse.course_code}_evals.csv")
  end
  def export_eval_summary
    authorize current_user
    mycourse = Course.find_by_id(current_user.current_course)
    myproject= Project.find_by_id(current_user.current_project)
    roster_csv = CSV.generate do |csv|
      header=[]
      header.push()
      csv << ["Project: #{myproject.name}", "Course: #{mycourse.course_title}", "Quarter: #{mycourse.quarter}"]
      csv << ["Instructor: " + mycourse.instructor, "Downloaded by: " + current_user.first_name + " " + current_user.last_name, "Date: #{Time.now.strftime("%m/%d/%Y")}"]
      csv << ["Time: #{Time.now.strftime("%I:%M %p")}", "Total Teams: #{myproject.groups.uniq.size}", "Total Students: #{mycourse.users.where(role:0).size}"]
      csv << ["Student", "Average"]
avg=0
      myproject.evaluations.each do |eval|
        eval.eval_relations.each do |relation|
          if user == User.find_by_id(relation.user_id)
            avg = avg+(eval.effort.to_f + eval.reliability.to_f + eval.quality.to_f)/3
          else 
            user = User.find_by_id(relation.user_id)
            avg=0
            avg = (eval.effort.to_f + eval.reliability.to_f + eval.quality.to_f)/3
          csv << [user.first_name + " " + user.last_name, avg]
        end 
      end
    end
    send_data(roster_csv, type:  'text/csv', filename: "#{mycourse.course_code}_eval_summary.csv")
  end

  private

  def evaluation_params
    params.require(:evaluation).permit(:id, :quality, :reliability, :effort, :comments)
  end
end