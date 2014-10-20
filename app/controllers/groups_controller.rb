class GroupsController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized, except: [:show]
  require 'csv'

  def index
    @users = User.all
    @courses = Course.all
    @groups = Group.all
    authorize User.all
    @course = Course.find(current_user.current_course)
    @projects = @course.projects
  end

  private
  def secure_params
    params.require(:group).permit(:role)
  end
end