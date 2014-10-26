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

def clean_nils(csv)
  # remove all nils from array of arrays
  csv.each  do |nils|
   nils.compact!
  end
  #delete all empty arrays
  csv.delete_if {|x| x.empty? } 
  return csv
end


def csv_import
  authorize User.all
  # variables for counting how many users were added and how many roster relations made
  newc=0
  newr=0
  csv_text = File.open(params[:dump][:file].tempfile, :headers=>true)
  csv = CSV.parse(csv_text)
  csv = clean_nils(csv)
  #show array starting with [8] and 100 length afterwards.  Gets rid of UCI registrar text
  cdata = csv.slice!(8,100)
      @quarter = cdata[0][0] 
      @course_code = find_first_digits(cdata[1][0])  
      @instructor = get_instructor_name(cdata[3][0])
      @permissions = TA(cdata[8][0])
      @course_title = cdata[2][0]
      #@location = cdata[4][0]  if location is needed later

  studentdata = cdata.slice!(11,600)
  #finding the email and name columns
  emailcol = studentdata[0].index("Email")
  namecol = studentdata[0].index("Name")
   
  # makes new project for default 
  @newproj = Project.new(:course_id => @course_code, :name=>@course_code + "New Project")
  @newproj.name=@newproj.id
  @newproj.save
  #makes new course
  course = Course.new(:id => @course_code, :active_proj=>@newproj.id,:course_title=>@course_title, :instructor => @instructor[0])
  course.save
  # for every 'row' or array in studentdata array, excluding row 1 and the last two
  studentdata[1..-2].each do |i|
    #@netid will be jjones@uci.edu
    @netid = i[emailcol].downcase
    #@netid will be jjones
    @netid.slice! "@uci.edu"
    @name = i[namecol].titlecase
    @name = name_parse(@name)
    #@mail was jjones@uci.edu
    @mail = i[emailcol].downcase
    #if the ucinet id is found in the database
  if User.find_by(:ucinetid => @netid) != nil
    #set that ucinetid to @newuser, and add that corresponding
    #id with courseID in a new roster row
    @newuser = User.find_by(:ucinetid => @netid)
  else 
    #make a new user with the info we got from studentdata array
    @newuser = User.new(:ucinetid => @netid, :first_name => @name[0], :last_name => @name[1], :email => @mail, 
      :uci_affiliations => "student", :current_course =>  @course_code)
    if @newuser.save
      newc=+1
    end
  end
  roster = Roster.new(:course_id => @course_code, :user_id => @newuser.id)
    if roster.save
      newr+=1
    end
  end
  redirect_to :back, :notice => "CSV Import Successful,  #{newc} new users added to PartnerUp, #{newr} enrollments added to database"
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