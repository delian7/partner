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

  def phone_generator(user)
    phone = rand.to_s[2..11]
    user.phone = phone
    user.save
  end

  def availability_generator(user)
    case (1 + rand(6))
    when 1..2
      day1  = Faker::Time.between(7.days.ago, Time.now).strftime('%A')
      day2  = Faker::Time.between(7.days.ago, Time.now).strftime('%A') until (day2 != day1) && (!day2.nil?)
      availability = day1 + " or " + day2
    when 3
      day1  = Faker::Time.between(7.days.ago, Time.now).strftime('%A')
      day2  = Faker::Time.between(7.days.ago, Time.now).strftime('%A') until (day2 != day1) && (!day2.nil?)
      availability = day1 + " and " + day2
    when 4
      availability = Faker::Time.between(7.days.ago, Time.now).strftime('%A')
    when 5
      availability = "Weekend"
    when 6
      availability = "Weekday"
    end
    case (1 + rand(4))
    when 1
      availability = availability + " nights"
    when 2
      availability = availability + " evenings"
    when 3
      availability = availability + " mornings"
    when 4
      availability = availability + " anytime"
    end
    user.availability = availability
    user.save
  end

  def description_generator(user)
    description = Faker::Hacker.say_something_smart
    user.description = description
    user.save
  end

  def avatar_generator(user)
    avatar = File.open(Dir.glob(File.join(Rails.root, 'sample', '*')).sample)
    user.avatar = avatar
    user.save
  end

  def eval_generator(user)
    user.groups.each do |group|
      group.group_relations.each do |relation|
        if user.id != relation.user_id
          eval = Evaluation.create(quality: (50 + rand(50)), effort:(50 + rand(50)), reliability:(50 + rand(50)), comments: Faker::Hacker.say_something_smart)
          eval_relation = EvalRelation.create(user_id:user.id, reviewer_id: relation.user_id, group_id: group.id, project_id: group.project_id, evaluation_id: eval.id)
        end
      end
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

end
