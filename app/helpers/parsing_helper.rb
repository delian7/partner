module ParsingHelper

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

#gets the course title without the unit information
def course_unit_parse(txt)
  m = regexecute('(.*),(.*),.* (.*)')
  if m.match(txt)
    @word1, @word2, @word3 = m.match(txt)[1], m.match(txt)[2], m.match(txt)[3]
    return @word1 + ","+ @word2 + ", "+ @word3
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

end