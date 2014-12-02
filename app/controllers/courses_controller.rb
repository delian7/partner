class CoursesController < ApplicationController
  include CoursesHelper, UsersHelper, ParsingHelper
  before_filter :authenticate_user!
  #after_action :verify_authorized, except: [:show, :edit]

require 'csv'

  def index
  authorize current_user
  end

  def new
  authorize current_user
  end

  def edit
    @course = Course.find(params[:id])
  end

 def profile
    authorize current_user
  end

  def show
    @course = Course.find(params[:id])
    unless user_signed_in?
    authorize current_user
    redirect_to :back, :alert => "Access denied."
    end
  end

  def update
    authorize current_user
    @course = Course.find(params[:id])
    if @course.update_attributes(course_params)
      redirect_to :back, :alert => "Course updated successfully"
    else
      redirect_to :back, :error => "Course could not be updated"
    end
  end


  def remove
    authorize current_user
    if Course.find_by_id(params[:id]) != nil
    @course = Course.find(params[:id])
        @course.users.each do |user|
        set_current_project_course(user, Project.find_by_id(0), Course.find_by_id(0))
        end
    destroy_roster_relations(@course)
    destroy_project_relations(@course)
    @course.destroy
    @course.save ? flash[:notice] = "Success!  Course has been deleted" : flash[:error] = "Course could not be deleted"
    redirect_to(:action => 'index')
    end
  end

def destroy
  authorize current_user
  if Course.find_by_id(params[:id]) != nil
  @course = Course.find(params[:id])
      @course.users.each do |user|
      set_current_project_course(user, Project.find_by_id(0), Course.find_by_id(0))
      end
  destroy_roster_relations(@course)
  destroy_project_relations(@course)
  @course.destroy
  @course.save ? flash[:notice] = "Success!  Course has been deleted" : flash[:error] = "Course could not be deleted"
  redirect_to(:action => 'index')
  end
end


def open_and_parse_csv
  csv_text = File.open(params[:dump][:file].tempfile, :headers => true)
  csv = CSV.parse(csv_text)
  csv = remove_nils(csv)
  start_course_index = csv.find_index{|each| each[0].include?("Quarter,")}
  
  data_slice(csv, 0, start_course_index)
    start_student_index = csv.find_index{|each| each.include?("Student#")}
    student_length = csv.length - start_student_index

  course_csv = data_slice(csv, 0, start_student_index)
  @course_data = get_course_data(course_csv)
  @student_data = csv
  # enrolls = Course.find(@course_code).users.pluck(:ucinetid)
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
   if !enrolled?(@netid, @course_code) && in_new_roster?(@netid)
      roster = Roster.create(course_id: @course_code, user_id: @user.id)
      set_current_project_course(@user, @proj, @course)
      add+=1
  end
end

      Course.find(@course_code).users.pluck(:ucinetid).each do |enrolled_netid|
      if enrolled?(enrolled_netid, @course_code) && !in_new_roster?(enrolled_netid)
        Roster.find_by(user_id: User.find_by(ucinetid: enrolled_netid).id, course_id: @course_code).destroy
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