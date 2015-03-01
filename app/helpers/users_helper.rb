module UsersHelper

  # def my_partner_for(project)
  #   if has_grouprelation_for?(current_user, @myproject)
  #     @mygroup = Group.find(GroupRelation.where(project_id: @myproject.id, user_id: current_user.id).first.group_id)
  #     one = GroupRelation.where(project_id: project, group_id: @mygroup.id).where.not(user_id: current_user.id)[0].user_id
  #     user = User.find(one)
  #   end
  # end

  def set_current_users_instance_variables
    if user_signed_in?
      #making variables so easier to find the users current project and course
      if Project.find_by_id(current_user.current_project).nil? || Course.find_by_id(current_user.current_course).nil?
        current_user.current_project = "0"
        current_user.current_course = "0"
      end
      @mycourse = Course.find_by_id(current_user.current_course)
      @myproject = Project.find_by_id(current_user.current_project)
      # gets group size allowed for the current_users current_project
      @allowed_group_size = @myproject.group_size
      #current user is enrolled in the course that is currently in their curr projs column
      if current_user.courses.include?(@mycourse)
        @my_courses = Roster.where(user_id: current_user.id).collect
      end

      if !current_user.groups.where(project_id: @myproject.id).empty?
        @mygroup = Group.find_by_id(current_user.groups.where(project_id: @myproject.id))
        @current_group_size = @mygroup.users.size
      else
        @current_group_size = 0
      end
      current_user.groups.order(:project_id).uniq.each do |group|
        is_current_user_requested = (group.group_relations.find_by(user_id: current_user.id, group_id: group.id).status == 1)
        is_current_user_confirmed = (group.group_relations.find_by(user_id: current_user.id, group_id: group.id).status == 2)
        incoming_requests = (current_user.group_relations.where(status:1).size) + (GroupRelation.where(group: group, status:0).size)
        are_there_any_users_sending_requests = (group.group_relations.find_by(status: 0) != nil)
      end
    end
  end

  def set_current_project_course(user, project, course)
    (user.current_project = project.id) if !project.nil?
    (user.current_course = course.id) if !course.nil?
    user.save
  end

  def enrolled?(ucinetid, course)
    Course.find_by_id(course.id).users.include?(User.find_by(ucinetid: ucinetid))
  end

  def classmates?(user,course)
    user.courses.include?(course) && current_user.courses.include?(course)
  end

  def teammates?(user, user2)
    confirmed?(user2) && confirmed?(user)
  end


  def in_group_for?(user, project)
    if project.group_relations.collect(&:user_id).include?(user.id)
      !user.group_relations.where(project_id: project.id, status:2).nil?
    end
  end

  def previously_partnered?(user1, user2)
    if Project.find(current_user.current_project).allow_repeat && !(user1.groups & user2.groups).empty?
      (user1.groups & user2.groups).each do |group|
        if group.course == Course.find(current_user.current_course)
          return true
        end
      end
    end
    return false
  end

end
