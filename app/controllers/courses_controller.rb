class CoursesController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized, except: [:show, :edit]

require 'csv'

def index
  @users = User.all
  @courses = Course.all
  @groups = Group.all
  authorize @users
end

def new
  @courses = Course.all
  authorize @users
end

def show
  @course = Course.find(params[:id])
  unless user_signed_in?
  authorize @user
  redirect_to :back, :alert => "Access denied."
  end
end

def profile
  @courses = current_course
  authorize @users
end

def destroy
  course = Course.find(params[:id])
  authorize User.all
  unless course == current_course
    course.destroy
    redirect_to courses_path, :notice => "course deleted."
  else
    redirect_to courses_path, :notice => "Can't delete yourself."
  end
end

def mailer
  ChangeMailer.send_change_message(course.email).deliver
end

def find_first_digits(txt)
  re=('.*?(\\d+)')
  m=Regexp.new(re,Regexp::IGNORECASE);
    if m.match(txt)
        return m.match(txt)[1];
    end
end
#gets instructors name from cell and returns both last name with spaces 
#accounted for and first initial
def get_instructor_name(txt)
  re=('Instructor:\s(.*?){1},\s(.*).')
  m=Regexp.new(re,Regexp::IGNORECASE);
  if m.match(txt)
      word1=m.match(txt)[1];
      c1=m.match(txt)[2];
  return word1, c1
  end
end

#gets TA from box by getting the last thing after 'ID:' 
def TA_parse(txt)
  re=('ID:\s(.*)')
  m=Regexp.new(re,Regexp::IGNORECASE);
  if m.match(txt)
      word1=m.match(txt)[1];
  return word1
  end
end

def course_unit_parse(txt)
  re=('(.*),(.*),.* (.*)')
  m=Regexp.new(re,Regexp::IGNORECASE);
  if m.match(txt)
      word1=m.match(txt)[1];
      word2=m.match(txt)[2];
      word3=m.match(txt)[3];
  return word1 + ", "+ word2 + ", "+ word3
  end
end

#parses first name last name with commas
def name_parse(txt)
  re=('(.*),\s(.*)')
  m=Regexp.new(re,Regexp::IGNORECASE);
  if m.match(txt)
      word1=m.match(txt)[1];
      word2=m.match(txt)[2];
  return word1, word2
  end
end

def remove_nils(array)
# remove all nils from array of arrays
array.each  do |nils|
   nils.compact!
  end
  #delete all empty arrays
  array.delete_if {|x| x.empty? }
  return array
end

def get_student_data(i, student_data_array)
  while i.size > 2
    @name_col = student_data_array[0].index("Name")
    @mail_col = student_data_array[0].index("Email")
    #@netid will be jjones@uci.edu
    @netid = i[@mail_col].downcase
    #@netid will be jjones
    @netid.slice! "@uci.edu"
    @name = i[@name_col].titlecase
    @name = name_parse(@name)
    #@mail was jjones@uci.edu
    @mail = i[@mail_col].downcase
    return @mail, @name, @netid
  end
end

def data_slice(array, x, y)
  array.slice!(x,y)
end

def get_course_data(array)
  @quarter = array[0][0]
  @course_code = find_first_digits(array[1][0])  
  @instructor = get_instructor_name(array[3][0])
  @permissions = TA_parse(array[8][0])
  @course_title = course_unit_parse(array[2][0])
  #@course_title = array[2][0]
  #@location = csv[4][0]  if location is needed later
  return @quarter, @course_code, @instructor, @permissions, @course_title
end

def set_current_project_course(user, project, course)
  user.current_project = project.id
  user.current_course = course.id
  user.save
  end

def destroy_roster_relation(netid, coursecode)
  if user_exists?(netid)
  @newuser = User.find_by(:ucinetid => netid)
  set_current_project_course(@newuser, Project.find(0), Course.find(0))
  roster = Roster.where(course_id: coursecode, user_id: User.find_by(:ucinetid => netid).id).first
  roster.destroy
end
end

def enrolled_students(course_code)
  @enrolled_students_array = []
  array = Roster.where(course_id: course_code).pluck(:user_id)
  array.each do |i|
    if user_exists?(:id, i)
      user = User.find(i)
      @enrolled_students_array.push(user.ucinetid)
    end
  end
return @enrolled_students_array
  end

  def model_findby(model, findby, id)
    model.find_by(findby => id).nil?
  end

def csv_netids(student_data_array)
    @student_netids = []
    student_data_array.each do |i|
    @netid = i[@mail_col].downcase
    @netid.slice! "@uci.edu"
    @student_netids.push(@netid)
    end
    @student_netids.push(current_user.ucinetid)
end

def in_new_roster?(ucinetid, student_data_array)
  if user_exists?(:ucinetid, @netid)
    user = User.find_by(:ucinetid => ucinetid)
    @student_netids = csv_netids(student_data_array)
      @student_netids.each do |enrolled_student_netid|
       if ucinetid == enrolled_student_netid
        return true
       end
    end
  end
  return false
end

def enrolled?(ucinetid, coursecode)
  if user_exists?(:ucinetid, @netid)
    user = User.find_by(:ucinetid => ucinetid)
    if Roster.find_by(:user_id => user.id, course_id: coursecode) != nil
      return true
    end
  end
  return false
end

def user_exists?(findby, id)
  if User.find_by(findby => id) != nil
    return true
  else
    return false
  end
end

def open_and_parse_csv
  csv_text = File.open(params[:dump][:file].tempfile, :headers => true)
  csv = CSV.parse(csv_text)
  csv = remove_nils(csv)
  csv = data_slice(csv, 8, 100)
  return csv
end

def csv_import
  authorize User.all
  # variables for counting how many roster relations made
  add, removal = [0, 0]
  csv = open_and_parse_csv
  course_data = get_course_data(csv)
  student_data = data_slice(csv, 11, 600)
  enrolls = enrolled_students(@course_code)

  #makes new course and project, sets prof's curcourse and curproj to new sutff
  if model_findby(Course, :id, @course_code).nil?
  @course = Course.new(:id => @course_code,:course_title => @course_title, :instructor => @instructor[0])
  @course.save
  @newproj = Project.new(name: "#{@course_title} New Project", course_id: @course_code, active: true, group_size: 2)
  @newproj.save
  else
  @course = Course.find_by_id(@course_code)
      if Project.where(course_id: @course_code, active: true).first
        @newproj = Project.where(course_id: @course_code, active: true).first
        @newproj.save
      else
        @newproj = Project.new(name: "#{@course_title} New Project", course_id: @course_code, active: true, group_size: 2)
        @newproj.save
      end
  set_current_project_course(current_user, @newproj, @course)
  end
 
  # for every 'row' or array in studentdata array, excluding row 1 and the last two
  student_data[1..-2].each do |i|
    get_student_data(i, student_data)
    # if i student exists, find them
  if user_exists?(:ucinetid, @netid)
    @newuser = model_findby(User, :ucinetid, @netid)
  else 
    #make a new user with the info we got from studentdata array
    @newuser = User.new(:ucinetid => @netid, :first_name => @name[0], :last_name => @name[1], :email => @mail, 
      :uci_affiliations => "student", :current_course =>  @course_code)
    @newuser.save
  end
   if !enrolled?(@netid, @course_code) && in_new_roster?(@netid, student_data)
      roster = Roster.new(:course_id => @course_code, :user_id => @newuser.id)
      set_current_project_course(@newuser, @newproj, @course)
    if roster.save
      add+=1
    end
  end
end
      enrolls.each do |enrolled_student_netid|
      if enrolled?(enrolled_student_netid, @course_code) && !in_new_roster?(enrolled_student_netid, student_data)
        destroy_roster_relation(enrolled_student_netid, @course_code)
        removal+=1
      else
        set_current_project_course(@newuser, @newproj, @course)
      end
      end 
  redirect_to :back, :notice => "CSV Import Successful,  #{add} students added to this class, #{removal} students removed from this class"
end

  def update
    authorize User.all
    @course = Course.find(params[:id])
    
    if @course.update_attributes(course_params)
      flash[:notice] = "Course updated successfully"
      redirect_to(:action => 'index')
    else
      flash[:error] = "Course could not be updated"
      render('edit')
    end
  end


  def edit
    @course = Course.find(params[:id])
  end

  def remove
    authorize User.all
    while Course.find(params[:id]) != nil
    @course = Course.find(params[:id])
    @course.destroy
    if @course.save
      flash[:notice] = "Course Deleted"
    else
      flash[:error] = "Course could not be deleted"
    end
    redirect_to(:action => 'index')
  end
  end
  
private 
  
  def course_params
    params.require(:course).permit(:course_title, :active_proj, :instructor, :id)
  end 

  def secure_params
    params.require(:user).permit(:current_course)
  end

end