class GroupsController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized, except: [:show]
  helper_method :group_or_partnership?
  require 'csv'

  def index
    @users = User.all
    @courses = Course.all
    authorize User.all
    @course = Course.find_by_id(current_user.current_course)
    
    
    @current_projects = Project.where(course_id: current_user.current_course, active: true)
    # @allowed_group_size = Project.find_by_id(@current_project.id).group_size
    # @current_group_size = GroupRelation.where(project_id: current_project.id, course_id: current_user.current_course).uniq.pluck(:user_id).size

    # there should be only one current project active at a time... TODO error checking!
    @course_projects = @course.projects
  end
  

  def group_or_partnership?
    Project.find_by_id(current_user.current_project).group_size > 1 ? 'group' : 'partnership'
  end

  private
  def secure_params
    params.require(:group).permit(:name)
  end
end