class GroupsController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized, except: [:show]
  require 'csv'

  def index
    @users = User.all
    @courses = Course.all
    authorize User.all
    @course = Course.find_by_id(current_user.current_course)
    
    
    current_project = Project.where(course_id: current_user.current_course, active: true).first
    allowed_group_size = Project.find_by_id(current_project.id).group_size
    current_group_size = GroupRelation.where(project_id: current_project.id, course_id: current_user.current_course).uniq.pluck(:user_id).size
    
    # there should be only one current project active at a time... TODO error checking!
    @course_projects = @course.projects
  end

  private
  def secure_params
    params.require(:group).permit(:name)
  end
end