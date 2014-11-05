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

# If the course is partnered, it will clear the group of the current_course and the partner
# If the course is unpartnered, it will partner them
# Partnering sets status to 1 or true and fills the current_course (and their partner's) partner1 with the other person's name
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
def TA(txt)
  re=('ID:\s(.*)')
  m=Regexp.new(re,Regexp::IGNORECASE);
  if m.match(txt)
      word1=m.match(txt)[1];
  return word1
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

def find_email_col(array)
  array[0].index("Email")
end

def find_name_col(array)
  array[0].index("Name")
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

def get_student_data(i)
      #@netid will be jjones@uci.edu
    @netid = i[emailcol].downcase
    #@netid will be jjones
    @netid.slice! "@uci.edu"
    @name = i[namecol].titlecase
    @name = name_parse(@name)
    #@mail was jjones@uci.edu
    @mail = i[emailcol].downcase
end

def student_data_slice(array)
  array.slice!(11,600)
end

def remove_registrar_text(array)
  #show array starting with [8] and 100 length afterwards.  Gets rid of UCI registrar text
  asdf = array.slice!(8,100)
  return asdf
end

def get_course_data(array)
  @quarter = array[0][0]
  @course_code = find_first_digits(array[1][0])  
  @instructor = get_instructor_name(array[3][0])
  @permissions = TA(array[8][0])
  @course_title = array[2][0]
  #@location = csv[4][0]  if location is needed later
end
def newproj
    # makes new project for default 
  @newproj = Project.new(:course_id => @course_code, :name => @course_code + "New Project")
  @newproj.name = @newproj.id
  @newproj.save
end
def newcourse
   #makes new course
  @course = Course.new(:id => @course_code, :active_proj => @newproj.id,:course_title => @course_title, :instructor => @instructor[0])
  @course.save

end


def csv_import
  authorize User.all
  # variablesfor counting how many roster relations made
  newr=0
  csv_text = File.open(params[:dump][:file].tempfile, :headers => true)
  csv = CSV.parse(csv_text)
  remove_nils(csv)
  remove_registrar_text(csv)
  course_data = get_course_data(csv)
  student_data = student_data_slice(course_data)
  #finding the email and name columns
  emailcol = find_email_col(array)
  namecol = find_name_col(array)
  
  newcourse
  newproj
 
  # for every 'row' or array in studentdata array, excluding row 1 and the last two
  student_data[1..-2].each do |i|
    get_student_data(i)
    #if the ucinet id is found in the database
  if User.find_by(:ucinetid => @netid) != nil
    #set that ucinetid to @newuser, and add that corresponding
    #id with courseID in a new roster row
    @newuser = User.find_by(:ucinetid => @netid)
  else 
    #make a new user with the info we got from studentdata array
    @newuser = User.new(:ucinetid => @netid, :first_name => @name[0], :last_name => @name[1], :email => @mail, 
      :uci_affiliations => "student", :current_course =>  @course_code)
  end
  
  roster = Roster.new(:course_id => @course_code, :user_id => @newuser.id)
    if roster.save
      newr+=1
    end
  end
  redirect_to :back, :notice => "CSV Import Successful,  #{newr} students added to this class"
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
    @course = Course.find(params[:id])
    @course.destroy
    if @course.save
      flash[:notice] = "Course Deleted"
    else
      flash[:error] = "Course could not be deleted"
    end
    redirect_to(:action => 'index')
  end
  
private 
  
  def course_params
    params.require(:course).permit(:course_title, :active_proj, :instructor, :id)
  end 

  def secure_params
    params.require(:user).permit(:current_course)
  end

end