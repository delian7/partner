module UsersHelper

def get_status(user)
	@mygroup = GroupRelation.where(:project_id => @myproject, :user_id => current_user.id).pluck(:group_id)[0]
    @current_user_status = GroupRelation.where(:project_id => @myproject, :user_id => current_user.id, :group_id=>@mygroup).pluck(:status)[0]
    @user_status = GroupRelation.where(:project_id => @myproject, :user_id => user.id, :group_id=>@mygroup).pluck(:status)[0]
  end

  def course_ids(user)
	user.courses.pluck(:id)
  end

def set_current_users_instance_variables
    @users = User.all
    @mycourse = current_user.current_course 
    @myproject = current_user.current_project
    @current_projects = Project.where(course_id: @mycourse, active: true)
	@mygroup = GroupRelation.where(project_id: @myproject, user_id: current_user.id).first.group_id if has_grouprelation_for?(current_user, @myproject)
end

def set_current_project_course(user, project, course)
  user.current_project = project.id
  user.current_course = course.id
  user.save
 end

def set_confirm_add_to_group(user)
  requested = GroupRelation.where(:project_id => current_user.current_project, :user_id => requested?(user).id, :group_id=>@mygroup)
  requested.status = 2
  requested.save
end

 def active_projects_for(coursecode)
    Project.where(course_id: coursecode, active: true)
end

def requester?(user)
	get_status(user)
if @current_user_status == 0
  return current_user
elsif @user_status == 0
  return user
end
end

def requested?(user)
	get_status(user)
if @current_user_status == 1
  return current_user
elsif @user_status == 1
  return user
end
end


def enrolled?(ucinetid, coursecode)
    Roster.find_by(:user_id => user_netid(ucinetid).id, course_id: coursecode) != nil ? true : false
end

def classmates?(user,course)
	course_ids(user).include?(course)
end

def teammates?(user, user2)
	confirmed?(user2) && confirmed?(user) ? true : false
end

def confirmed?(user)
	GroupRelation.where(:project_id => @myproject, :user_id => user.id, :group_id=>@mygroup).pluck(:status)[0] == 2
end

def has_grouprelation_for?(user, project)
	GroupRelation.where(project_id: project, user_id: user.id).first != nil
end

def is_student?(user)
	user.role == 0
end

def same?(x , y)
	x == y
end

def set_status_confirmed(user,user2)
  y = GroupRelation.where(:project_id => current_user.current_project, :user_id => requested?(user).id, :group_id=>@mygroup)
  y.status = 2
  y.save
end

def request_partner(user)
set_current_users_instance_variables
my_current_group_size = GroupRelation.where(project_id: current_user.current_project, course_id: current_user.current_course, group_id: @mygroup).uniq.pluck(:user_id).size

	if my_current_group_size >= 2
	    flash[:error] = "Unable to send request, you have too many pending requests."
	else
	  if !requester?(current_user) && !requested?(user)
	    newgroup = Group.create(name: "#{current_user.first_name} #{@mygroup}")
	    #create relation for current user which is always the requester (status=0, pending)
	    GroupRelation.create(course_id: @mycourse, user_id: current_user.id, project_id: @myproject, 
	  status: 0, group_id: newgroup.id)
	  else
	    newgroup = Group.find_by_id(@mygroup)
	  end
			# create relation for user who is being requested (status=1, requested)
			GroupRelation.create(course_id: @mycourse, user_id: user.id, project_id: @myproject, 
			  status: 1, group_id: newgroup.id)
			username = user.first_name + " " + user.last_name
			flash[:notice] = "Requested <b>#{username}</b>" + " as partner"
	end
end


def request_group_member(user)
set_current_users_instance_variables
# current_project only gets the first project. #TODO FIX! 
    allowed_group_size = Project.find_by_id(current_user.current_project).group_size
    my_current_group_size = GroupRelation.where(project_id: current_user.current_project, course_id: current_user.current_course, group_id: @mygroup).uniq.pluck(:user_id).size

	if my_current_group_size >= allowed_group_size
	    flash[:error] = "Unable to send request, you have too many pending requests."
	else
	  if !confirmed?(current_user) && ( !requester?(current_user) && !requested?(current_user) )
	    newgroup = Group.create(name: "#{current_user.first_name}'s group for #{Project.find(@myproject).name}")
	    #create relation for current user which is always the requester (status=0, pending)
	    GroupRelation.create(course_id: @mycourse, user_id: current_user.id, project_id: @myproject, 
	  status: 0, group_id: newgroup.id)
	  else
	    newgroup = Group.find_by_id(@mygroup)
	  end
	# create relation for user who is being requested (status=1, requested)
	GroupRelation.create(course_id: @mycourse, user_id: user.id, project_id: @myproject, 
	  status: 1, group_id: newgroup.id)
	username = user.first_name + " " + user.last_name
	flash[:notice] = "Requested <b>#{username}</b> to your group: <b>#{newgroup.name}</b> "
	end
end

def confirm_group_member(user)
    # sets the status of the group to accepted "status=2"
    if set_confirm_add_to_group(user)
      redirect_to users_path(@current_group), :flash => { :notice => "Group Confirmed" }
    else
      redirect_to users_path(@current_group), :flash => { :error => "There was a problem, try again" }
    end
    # if x.save && y.save
    #   redirect_to users_path(@current_group), :flash => { :notice => "Group Confirmed" }
    # else
    #   redirect_to users_path(@current_group), :flash => { :error => "There was a problem, try again" }
    # end
end

  def confirm_partner(user)
      # sets the status of the group to accepted "status=2"
      x = GroupRelation.find_by_id(GroupRelation.where(:project_id => @myproject, :user_id => requester?(user).id, :group_id=>@mygroup).pluck(:id)[0])
      y = GroupRelation.find_by_id(GroupRelation.where(:project_id => @myproject, :user_id => requested?(user).id, :group_id=>@mygroup).pluck(:id)[0])
        x.status = 2
        y.status = 2
      if x.save && y.save
        redirect_to users_path(@current_group), :flash => { :notice => "Group Confirmed" }
      else
        redirect_to users_path(@current_group), :flash => { :error => "There was a problem, try again" }
      end
end
end