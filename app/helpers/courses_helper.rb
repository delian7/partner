module CoursesHelper

def regexecute(exp)
Regexp.new(exp,Regexp::IGNORECASE)  
end

def find_first_digits(txt)
  m = regexecute('.*?(\\d+)') 
  return m.match(txt)[1] if m.match(txt)
end
#gets instructors name from cell and returns both last name with spaces 
#accounted for and first initial
def get_instructor_name(txt)
  m = regexecute('Instructor:\s(.*?){1},\s(.*).')
  return m.match(txt)[1], m.match(txt)[2] if m.match(txt)
end

#gets TA from box by getting the last thing after 'ID:' 
def TA_parse(txt)
  m = regexecute('ID:\s(.*)') 
  return m.match(txt)[1] if m.match(txt)
end

def course_unit_parse(txt)
  m = regexecute('(.*),(.*),.* (.*)')
  if m.match(txt)
    word1, word2, word3 = m.match(txt)[1], m.match(txt)[2], m.match(txt)[3]
    return word1 + ","+ word2 + ", "+ word3
  end
end

#parses first name last name with commas
def name_parse(txt)
  m = regexecute('(.*),\s(.*)')
  if m.match(txt)
  	word1,word2 = m.match(txt)[1],m.match(txt)[2] 
  return word1, word2
  end
end

def get_student_data(i, student_data_array)
  if i.size > 2
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

def data_slice(array, x, y)
  array.slice!(x,y)
end

def make_default_project(coursetitle, coursecode)
  if active_projects_for(coursecode).first
    @proj = Project.where(course_id: coursecode, active: true).first
  else
    @proj = Project.create(name: "#{coursetitle} New Project", course_id: coursecode, active: true, group_size: 2)
  end
  return @proj
end

def set_current_project_course(user, project, course)
  user.current_project = project.id
  user.current_course = course.id
  user.save
 end

def remove_nils(array)
  # remove all nils from array of arrays
  array.each { |nils|  nils.compact! }
  # delete all empty arrays
  array.delete_if { |x| x.empty? }
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

def user_netid(ucinetid)
    User.find_by(ucinetid: ucinetid)
end

def course_id(coursecode)
    Course.find_by(id: coursecode)
end

def active_projects_for(coursecode)
    Project.where(course_id: coursecode, active: true)
end

def user_exists?(symbol, id)
  User.find_by(symbol => id) == nil ? false : true
end

def enrolled?(ucinetid, coursecode)
    Roster.find_by(:user_id => user_netid(ucinetid).id, course_id: coursecode) != nil ? true : false
end

def in_new_roster?(ucinetid, student_data_array)
  if user_exists?(:ucinetid, ucinetid)
      @student_netids = csv_netids(student_data_array)
      @student_netids.each do |enrolled_student_netid|
       return true if ucinetid == enrolled_student_netid
  	  end
  return false
	end
end
end