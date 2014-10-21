class CoursesController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized, except: [:show]

require 'csv'

def index
  @users = User.all
  @courses = Course.all
  @groups = Group.all
  authorize @users
end

def new
  @courses = Course.all
  @course = Course.create(:course_id=>400, :course_title=>"60")
  authorize @users
  # build_resource({})
  # respond_with self.resource
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

def update
  @course = Course.find(params[:id])
  authorize @user
  if @course.update_attributes(secure_params)
    redirect_to courses_path, :notice => "course updated."
  else
    redirect_to courses_path, :alert => "Unable to update course."
  end
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
def get_instructor_name(txt)
re=('Instructor:\s(.*?){1},\s(.*).')
m=Regexp.new(re,Regexp::IGNORECASE);
if m.match(txt)
    word1=m.match(txt)[1];
    c1=m.match(txt)[2];
return word1, c1
end
end

def TA(txt)
re=('ID:\s(.*)')
m=Regexp.new(re,Regexp::IGNORECASE);
if m.match(txt)
    word1=m.match(txt)[1];
return word1
end
end

def name_parse(txt)
re=('(.*),\s(.*)')
m=Regexp.new(re,Regexp::IGNORECASE);
if m.match(txt)
    word1=m.match(txt)[1];
    word2=m.match(txt)[2];
return word1, word2
end
end

def csv_import 
  authorize User.all
  n=0
  csv_text = File.open(params[:dump][:file].tempfile, :headers=>true)
  csv = CSV.parse(csv_text)
  # remove all nils from array of arrays
  csv.each  do |nils|
   nils.compact!
  end
  #delete all empty arrays
  csv.delete_if {|x| x.empty? } 
  #show array starting with [8] and 100 length afterwards.  Gets rid of UCI registrar text
  cdata = csv.slice!(8,100)
  
      @quarter = cdata[0][0] 
      @course_code = find_first_digits(cdata[1][0])  
      @instructor = get_instructor_name(cdata[3][0])
      @permissions = TA(cdata[8][0])
      @course_title = cdata[2][0]
      #@location = cdata[4][0]

  studentdata = cdata.slice!(11,600)
  emailcol = studentdata[0].index("Email")
  namecol = studentdata[0].index("Name")
   # Course.new(id: )
   course = Course.new(:id => @course_code, :course_title=>@course_title, :instructor => @instructor[0])
   course.save
  studentdata[1..-2].each do |i|
    @netid = i[emailcol].downcase
    @netid.slice! "@uci.edu"
    @name = i[namecol].titlecase
    @name = name_parse(@name)
    @mail = i[emailcol].downcase
  if User.find_by(:ucinetid => @netid) != nil
    user = User.find_by(:ucinetid => @netid)
    Roster.new(:course_id => @course_code, :user_id => user.id)
  else 
    user = User.new(:ucinetid => @netid, :first_name => @name[0], :last_name => @name[1], :email => @mail, 
      :uci_affiliations => "student", :current_course =>  @course_code)
  end
  roster = Roster.new(:course_id => @course_code, :user_id => user.id)
  roster.save
  user.save
  
  end
  redirect_to :back, :notice => "CSV Import Successful,  #{n} new users added to PartnerUp, #{n} enrollments added to database"
end

private
def secure_params
  params.require(:user).permit(:current_course)
end

end