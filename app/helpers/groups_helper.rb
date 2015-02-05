module GroupsHelper

# def get_status(user)
#   if @mygroup.nil? || (current_user.groups & user.groups).empty?
#     return 0
#   else
#     their_group = (current_user.groups & user.groups)[0]
#     their_group.group_relations.each do |relation|
#       @user_status = relation.status if (relation.user_id == user.id) && (relation.group_id == their_group.id)
#       return @user_status
#     end
#   end
# end

def group_namer(namegen)
  case namegen
  when "number"
    @groupname = "Team #{Group.where(project_id: @project.id).size + 1}"
  when "random"
    @groupname = "Team #{Faker::Team.random.titlecase}"
  when "creature"
    @groupname = "Team #{Faker::Team.creature.titlecase}"
  when "color"
    @groupname = "Team #{Faker::Commerce.color.titlecase}"
  when "gamer"
    @groupname = "#{Faker::Hacker.gamer.titlecase}"
  when "partner"
    @groupname = "#{current_user.first_name} and #{User.find(params[:id]).first_name}"
  end
  return @groupname
end

# def set_current_users_instance_variables
# @users = User.all
# @mycourse = Course.find(current_user.current_course)
# @myproject = Project.find(current_user.current_project)
# @groups = Group.all
# @allowed_group_size = @myproject.group_size
# @current_projects = Project.where(course_id: @mycourse.id, active: true)
#   if enrolled?(current_user.ucinetid, @mycourse)
#   	@my_courses = Roster.where(user_id: current_user.id).collect
#   end
  	
#   if has_grouprelation_for?(current_user, @myproject)
# 	 @mygroup = Group.find(GroupRelation.find_by(project_id: @myproject.id, user_id: current_user.id)) 
# 	 @current_group_size = GroupRelation.where(group_id: @mygroup.id).size
# 	 elseGroup.find(GroupRelation.find_by(project_id: @myproject.id, user_id: current_user.id)) 
# 	 @current_group_size = 0
#   end
# end

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

# def active_projects_for(coursecode)
#   Project.where(course_id: coursecode, active: true)
# end

# def enrolled?(ucinetid, course)
#     Roster.find_by(user_id: user_netid(ucinetid).id, course_id: course.id) != nil
# end

# def classmates?(user,course)
# 	course_ids(user.id).include?(course.id)
# end

# def teammates?(user, user2)
# 	confirmed?(user2) && confirmed?(user)
# end

# def confirmed?(user)
# 	relation = GroupRelation.where(user_id: user.id, project_id: @myproject.id).first
# 	relation.status == 2 if !relation.nil?
# end

# def has_grouprelation_for?(user, project)
# 	GroupRelation.where(project_id: project, user_id: user.id).first != nil
# end

# def in_group_for?(user, project)
#    GroupRelation.where(project_id: project, user_id: user.id).first != nil && GroupRelation.where(project_id: project, user_id: user.id).first.status ==2
# end

# def set_status_confirmed(user,user2)
#   y = GroupRelation.where(project_id: @myproject.id, user_id: requested?(user).id, group_id: @mygroup.id)
#   y.status = 2
#   y.save
# end

# def request_partner(user)
# set_current_users_instance_variables
# 	if @current_group_size >= 2
# 	    flash[:error] = "Unable to send request, you have too many pending requests."
# 	else
# 	  if !requester?(current_user) && !requested?(user)
# 	    newgroup = Group.create(name: "#{current_user.first_name} #{@mygroup}")
# 	    #create relation for current user which is always the requester (status=0, pending)
# 	    GroupRelation.create(course_id: @mycourse.id, user_id: current_user.id, project_id: @myproject.id, 
# 	  status: 2, group_id: newgroup.id)
# 	  else
# 	    newgroup = Group.find_by_id(@mygroup)
# 	  end
# 			# create relation for user who is being requested (status=1, requested)
# 			GroupRelation.create(course_id: @mycourse.id, user_id: user.id, project_id: @myproject.id, 
# 			  status: 2, group_id: newgroup.id)
# 			username = user.first_name + " " + user.last_name
# 			flash[:notice] = "Requested <b>#{username}</b>" + " as partner"
# 	end
# end


# def request_group_member(user)
# set_current_users_instance_variables
# # current_project only gets the first project. #TODO FIX! 
# 	if @current_group_size >= @allowed_group_size
# 	    flash[:error] = "Unable to send request, you have too many pending requests."
# 	else
# 	  if !confirmed?(current_user) && ( !requester?(current_user) && !requested?(current_user) )
# 	    newgroup = Group.create(name: "#{current_user.first_name}'s group for #{Project.find(@myproject).name}")
# 	    #create relation for current user which is always the requester (status=0, pending)
# 	    GroupRelation.create(course_id: @mycourse.id, user_id: current_user.id, project_id: @myproject.id, 
# 	  status: 2, group_id: newgroup.id)
# 	  else
# 	    newgroup = Group.find_by_id(@mygroup)
# 	  end
# 	# create relation for user who is being requested (status=1, requested)
# 	GroupRelation.create(course_id: @mycourse.id, user_id: user.id, project_id: @myproject.id, 
# 	  status: 2, group_id: newgroup.id)
# 	username = user.first_name + " " + user.last_name
# 	flash[:notice] = "Requested <b>#{username}</b> to your group: <b>#{newgroup.name}</b> "
# 	end
# end

# def confirm_group_member(user)
#     # sets the status of the group to accepted "status=2"
#     if set_confirm_add_to_group(user)
#       redirect_to users_path(@current_group), flash: { :notice => "Group Confirmed" }
#     else
#       redirect_to users_path(@current_group), flash: { :error => "There was a problem, try again" }
#     end
#     # if x.save && y.save
#     #   redirect_to users_path(@current_group), :flash => { :notice => "Group Confirmed" }
#     # else
#     #   redirect_to users_path(@current_group), :flash => { :error => "There was a problem, try again" }
#     # end
# end

#   def confirm_partner(user)
#       # sets the status of the group to accepted "status=2"
#       x = GroupRelation.find_by_id(GroupRelation.where(project_id: @myproject.id, user_id: requester?(user).id, group_id: @mygroup.id).pluck(:id)[0])
#       y = GroupRelation.find_by_id(GroupRelation.where(project_id: @myproject.id, user_id: requested?(user).id, group_id: @mygroup.id).pluck(:id)[0])
#         x.status = 2
#         y.status = 2
#       if x.save && y.save
#         redirect_to users_path(@current_group), flash: { :notice => "Group Confirmed" }
#       else
#         redirect_to users_path(@current_group), flash: { :error => "There was a problem, try again" }
#       end
#   end


end
