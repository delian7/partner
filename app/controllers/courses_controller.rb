class CoursesController < ApplicationController
  include CoursesHelper
  before_filter :authenticate_user!
  #after_action :verify_authorized, except: [:show, :edit]

require 'csv'

  def index
    @users = User.all
    @courses = Course.all
    @groups = Group.all
    authorize @users
  end

  def new
    authorize @users
  end

  def show
    @course = Course.find(params[:id])
    unless user_signed_in?
    authorize @users
    redirect_to :back, :alert => "Access denied."
    end
  end

  def profile
    authorize @users
  end

  def update
    authorize User.all
    @course = Course.find(params[:id])
    
    if @course.update_attributes(course_params)
      flash[:notice] = "Course updated successfully"
      redirect_to(:action => 'index')
    else
      flash[:error] = "Course could not be updated"
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def remove
    authorize User.all
    if !Course.find(params[:id]).nil?
    @course = Course.find(params[:id])
        enrolled_students(@course.id).each do |enrolled_student_netid|
        destroy_roster_relation(enrolled_student_netid, @course.id)
        set_current_project_course(@user, Project.find(0), Course.find(0))
        end
      if !Project.where(course_id: @course.id).empty?
        Project.where(course_id: @course.id).each do |project|
        project.destroy
      end
    end
    @course.destroy
    @course.save ? flash[:notice] = "Course Deleted" : flash[:error] = "Course could not be deleted"
    redirect_to(:action => 'index')
    end
  end

def destroy
  course = Course.find(params[:id])
  authorize User.all
  unless course == current_course
    course.destroy
    redirect_to courses_path, :notice => "Course deleted."
  else
    redirect_to courses_path, :notice => "Can't delete yourself."
  end
end

def destroy_roster_relation(netid, coursecode)
  if user_exists?(:ucinetid, netid)
    @user = User.find_by(ucinetid: netid)
    set_current_project_course(@user, Project.find(0), Course.find(0))
    roster = Roster.find_by(course_id: coursecode, user_id: User.find_by(ucinetid: netid).id)
    roster.destroy
    relations = GroupRelation.where(course_id: coursecode, user_id: User.find_by(ucinetid: netid).id)
      relations.each do |deletions|
      deletions.destroy
      end
  end
end

def csv_netids(student_data_array)
  @student_netids = []
    student_data_array.each do |i|
      if i.size > 2
        @netid = i[@mail_col].downcase
        @netid.slice! "@uci.edu"
        @student_netids.push(@netid)
      end
    end
  @student_netids.push(current_user.ucinetid)
end


def open_and_parse_csv
  csv_text = File.open(params[:dump][:file].tempfile, :headers => true)
  csv = CSV.parse(csv_text)
  csv = remove_nils(csv)
  csv = data_slice(csv, 8, 100)
  @course_data = get_course_data(csv)
  @student_data = data_slice(csv, 11, 600)
    enrolls = enrolled_students(@course_code)
end

def csv_import
  # variables for counting how many roster relations made
  add, removal = [0, 0]
  csv = open_and_parse_csv
  # enrolls = enrolled_students(@course_code)
  #makes new course and project if doesnt exist
  if Course.where(id: @course_code)[0].nil?
    @course = Course.create(id: @course_code, course_title: @course_title, instructor: @instructor[0])
    Roster.create(course_id: @course_code, user_id: current_user.id)
    make_default_project(@course_code)
  else
    @course = Course.find(@course_code)
    @proj = @course.projects.find_by(active: true)
  end
    set_current_project_course(current_user, @proj, @course)
    
 
  # for every 'row' or array in studentdata array, excluding row 1 and the last two
  @student_data[1..-2].each do |i|
    get_student_data(i, @student_data)
    # if i student exists, find them
  if !User.find_by(ucinetid: @netid).nil?
    @user = User.find_by(ucinetid: @netid)
  else 
    #make a new user with the info we got from studentdata array
    @user = User.create(ucinetid: @netid, first_name: @name[0], last_name: @name[1], email: @mail, 
      uci_affiliations: "student", current_course:  @course_code)
  end
   if !enrolled?(@netid, @course_code) && in_new_roster?(@netid, @student_data)
      roster = Roster.create(course_id: @course_code, user_id: @user.id)
      set_current_project_course(@user, @proj, @course)
      add+=1
  end
end

      Course.find(@course_code).users.pluck(:ucinetid).each do |enrolled_student_netid|
      if enrolled?(enrolled_student_netid, @course_code) && !in_new_roster?(enrolled_student_netid, @student_data)
        destroy_roster_relation(enrolled_student_netid, @course_code)
        removal+=1
      else
        set_current_project_course(@user, @proj, @course)
      end
      end 
  
  redirect_to :back, :notice => "CSV Import Successful,  #{add} students added to this class, #{removal} students removed from this class"
end


  
private 
  
  def course_params
    params.require(:course).permit(:course_title, :instructor, :id)
  end 

  def secure_params
    params.require(:user).permit(:current_course)
  end

end