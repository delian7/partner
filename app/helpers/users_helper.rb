module UsersHelper

def my_partner_for(project)
  if has_grouprelation_for?(current_user, @myproject)
    @mygroup = Group.find(GroupRelation.where(project_id: @myproject.id, user_id: current_user.id).first.group_id) 
    one = GroupRelation.where(project_id: project, group_id: @mygroup.id).where.not(user_id: current_user.id)[0].user_id
    user = User.find(one)
  end
end

def set_current_users_instance_variables
  #making variables so easier to find the users current project and course
@mycourse = Course.find_by_id(current_user.current_course)
@myproject = Project.find_by_id(current_user.current_project)
 # gets group size allowed for the current_users current_project
@allowed_group_size = @myproject.group_size
  #current user is enrolled in the course that is currently in their curr projs column
  if current_user.courses.include?(@mycourse)
  	@my_courses = Roster.where(user_id: current_user.id).collect
  end
  
  if has_grouprelation_for?(current_user, @myproject)
    if !current_user.groups.where(project_id: @myproject.id).empty?
	 @mygroup = Group.find_by_id(current_user.groups.where(project_id: @myproject.id))
	 @current_group_size = @mygroup.users.size
  end
	else
	 @current_group_size = 0
  end
end

def set_current_project_course(user, project, course)
  user.current_project = project.id
  user.current_course = course.id
  user.save
end

def enrolled?(ucinetid, coursecode)   
    Course.find_by_id(coursecode).users.include?(User.find_by(ucinetid: ucinetid))
end

def classmates?(user,course)
  user.courses.include?(course) && current_user.courses.include?(course)
end

def teammates?(user, user2)
	confirmed?(user2) && confirmed?(user)
end

def confirmed?(user)
	get_status(user) == 2
end

def has_grouprelation_for?(user, project)
	project.group_relations.collect(&:user_id).include?(user.id)
end

def in_group_for?(user, project)
   project.group_relations.collect(&:user_id).include?(user.id) && confirmed?(user)
end

def is_student?(user)
	user.role == 0
end

def same?(x , y)
	x == y
end

end