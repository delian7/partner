module GroupsHelper

  def group_namer(namegen, project)
    case namegen
    when "number"
      @groupname = "Team #{Group.where(project_id: project.id).size + 1}"
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

end
