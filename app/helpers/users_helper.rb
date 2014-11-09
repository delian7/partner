module UsersHelper

def get_status(user)
    if !@mygroup.nil?
    @current_user_status = GroupRelation.where(project_id: @myproject.id, user_id: current_user.id, group_id: @mygroup.id).pluck(:status)[0]
    @user_status = GroupRelation.where(project_id: @myproject.id, user_id: user.id, group_id: @mygroup.id).pluck(:status)[0]
  end
end

  def course_ids(user)
	Roster.where(user_id: user).collect(&:course_id)
  end

   def group_ids(course)
	GroupRelation.where(course_id:course.id).collect(&:group_id).uniq
  end
  def groups_for(course)
  	group_array=[]
  	group_ids(course).each do |group|
  		group_array.push(Group.find(group))
  	end
  	return group_array
  end

  def user_netid(netid)
    User.find_by(ucinetid: netid)
  end

def set_current_users_instance_variables
	@users = User.all
    @mycourse = Course.find(current_user.current_course)
    @myproject = Project.find(current_user.current_project)
    @allowed_group_size = @myproject.group_size
    @current_projects = Project.where(course_id: @mycourse.id, active: true)
    if enrolled?(current_user.ucinetid, @mycourse)
    	@my_courses = Roster.where(user_id: 0).collect
    end
    	
    if has_grouprelation_for?(current_user, @myproject)
		@mygroup = Group.find(GroupRelation.where(project_id: @myproject.id, user_id: current_user.id).first.group_id) 
		@current_group_size = GroupRelation.where(group_id: @mygroup.id).size
		else
		@current_group_size = 0
	end
end

def set_current_project_course(user, project, course)
  user.current_project = project.id
  user.current_course = course.id
  user.save
 end

def set_confirm_add_to_group(user)
  requested = GroupRelation.where(user_id: requested?(user).id, group_id: @mygroup.id)
  requested.status = 2
  requested.save
end

 def active_projects_for(coursecode)
    Project.where(course_id: coursecode, active: true)
end

def requester?(user)
	get_status(user)
if @current_user_status == 2
  return current_user
elsif @user_status == 2
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
    Roster.find_by(user_id: user_netid(ucinetid).id, course_id: coursecode) != nil
end

def classmates?(user,course)
	course_ids(user.id).include?(course.id)
end

def teammates?(user, user2)
	confirmed?(user2) && confirmed?(user)
end

def confirmed?(user)
	relation = GroupRelation.where(user_id: user.id, project_id: @myproject.id).first
	relation.status == 2 if !relation.nil?
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
  y = GroupRelation.where(project_id: @myproject.id, user_id: requested?(user).id, group_id: @mygroup.id)
  y.status = 2
  y.save
end

def request_partner(user)
set_current_users_instance_variables

	if @current_group_size >= 2
	    flash[:error] = "Unable to send request, you have too many pending requests."
	else
	  if !requester?(current_user) && !requested?(user)
	    newgroup = Group.create(name: "#{current_user.first_name} #{@mygroup}")
	    #create relation for current user which is always the requester (status=0, pending)
	    GroupRelation.create(course_id: @mycourse.id, user_id: current_user.id, project_id: @myproject.id, 
	  status: 2, group_id: newgroup.id)
	  else
	    newgroup = Group.find_by_id(@mygroup)
	  end
			# create relation for user who is being requested (status=1, requested)
			GroupRelation.create(course_id: @mycourse.id, user_id: user.id, project_id: @myproject.id, 
			  status: 2, group_id: newgroup.id)
			username = user.first_name + " " + user.last_name
			flash[:notice] = "Requested <b>#{username}</b>" + " as partner"
	end
end


def request_group_member(user)
set_current_users_instance_variables
# current_project only gets the first project. #TODO FIX! 
	if @current_group_size >= @allowed_group_size
	    flash[:error] = "Unable to send request, you have too many pending requests."
	else
	  if !confirmed?(current_user) && ( !requester?(current_user) && !requested?(current_user) )
	    newgroup = Group.create(name: "#{current_user.first_name}'s group for #{Project.find(@myproject).name}")
	    #create relation for current user which is always the requester (status=0, pending)
	    GroupRelation.create(course_id: @mycourse.id, user_id: current_user.id, project_id: @myproject.id, 
	  status: 2, group_id: newgroup.id)
	  else
	    newgroup = Group.find_by_id(@mygroup)
	  end
	# create relation for user who is being requested (status=1, requested)
	GroupRelation.create(course_id: @mycourse.id, user_id: user.id, project_id: @myproject.id, 
	  status: 2, group_id: newgroup.id)
	username = user.first_name + " " + user.last_name
	flash[:notice] = "Requested <b>#{username}</b> to your group: <b>#{newgroup.name}</b> "
	end
end

def confirm_group_member(user)
    # sets the status of the group to accepted "status=2"
    if set_confirm_add_to_group(user)
      redirect_to users_path(@current_group), flash: { :notice => "Group Confirmed" }
    else
      redirect_to users_path(@current_group), flash: { :error => "There was a problem, try again" }
    end
    # if x.save && y.save
    #   redirect_to users_path(@current_group), :flash => { :notice => "Group Confirmed" }
    # else
    #   redirect_to users_path(@current_group), :flash => { :error => "There was a problem, try again" }
    # end
end

  def confirm_partner(user)
      # sets the status of the group to accepted "status=2"
      x = GroupRelation.find_by_id(GroupRelation.where(project_id: @myproject.id, user_id: requester?(user).id, group_id: @mygroup.id).pluck(:id)[0])
      y = GroupRelation.find_by_id(GroupRelation.where(project_id: @myproject.id, user_id: requested?(user).id, group_id: @mygroup.id).pluck(:id)[0])
        x.status = 2
        y.status = 2
      if x.save && y.save
        redirect_to users_path(@current_group), flash: { :notice => "Group Confirmed" }
      else
        redirect_to users_path(@current_group), flash: { :error => "There was a problem, try again" }
      end
end

  def delete_partnership(user)
    if !@mygroup.nil?
      if @current_group_size <= 2
        # Delete the group
        @mygroup.destroy
        # Delete relation for current user and user
        GroupRelation.find_by(user_id: current_user.id, group_id: @mygroup.id).destroy
        # Delete relation for user
      end
      GroupRelation.find_by(user_id: user.id, group_id: @mygroup.id).destroy
      flash[:notice] = "Removed User."
    else 
      flash[:error] = "Unable to remove user."
    end
  redirect_to users_path
  end

    def delete_self_from_group(user)
    set_current_users_instance_variables
    if !@mygroup.nil?
      if @current_group_size <= 2
        # Delete the group
        @mygroup.destroy
        # Delete relation for current user and user
        GroupRelation.find_by(user_id: current_user.id, group_id: @mygroup.id).destroy
        # Delete relation for user
      end
      GroupRelation.find_by(user_id: user.id, group_id: @mygroup.id).destroy
      flash[:notice] = "Removed User."
    else 
      flash[:error] = "Unable to remove user."
    end
  redirect_to users_path
  end


end