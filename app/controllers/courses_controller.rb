class CoursesController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized, except: [:show]
  require 'csv'

  def index
    @users = User.all
    @courses = Course.all
    @groups = Group.all
    #@course = course.find(params[:id])
    authorize @users
  end

  def new
    @courses = Course.all
    @course = Course.create(:course_id=>400, :course_title=>"60")
    #@course = course.find(params[:id])
    authorize @users
    # build_resource({})
    # respond_with self.resource
  end

  def show
    @course = course.find(params[:id])
    unless user_signed_in?
  # unless @course == current_course
    authorize @user
    redirect_to :back, :alert => "Access denied."
    end
  end

  def profile
    #unless course_signed_in?
    # unless @course == current_course
    @courses = current_course
    authorize @users
    #redirect_to :back, :alert => "Access denied."
  end

  def update
    @course = course.find(params[:id])
    authorize @user
    if @course.update_attributes(secure_params)
      redirect_to courses_path, :notice => "course updated."
    else
      redirect_to courses_path, :alert => "Unable to update course."
    end
  end

  def destroy
    course = course.find(params[:id])
    authorize User.all
    unless course == current_course
      course.destroy
      redirect_to courses_path, :notice => "course deleted."
    else
      redirect_to courses_path, :notice => "Can't delete yourself."
    end
  end

  # If the course is partnered, it will clear the group of the current_course and the partner
  # If the course is unpartnered, it will partner them
  # Partnering sets status to 1 or true and fills the current_course (and their partner's) partner1 with the other person's name
  def mailer
  ChangeMailer.send_change_message(course.email).deliver
  end

  

private
  def secure_params
      params.require(:course_user).permit(:user_id, :course_id)
  end
end