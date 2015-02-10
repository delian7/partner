module CoursesHelper

  def make_default_project(courseid)
    if !Project.where(course_id: courseid).empty?
      @proj = Project.find_by(course_id: courseid)
    else
      @proj = Project.create(name: "#{@word1} #{@word2} - New Project", course_id: courseid, group_size: 2)
    end
    ProjectRelation.create(course_id: courseid, project_id: @proj.id)
    return @proj
  end

  def set_current_project_course(user, project, course)
    user.current_project = project.id unless project.nil?
    user.current_course = course.id
    user.save
  end

  def remove_nils(array)
    # remove all nils from array of arrays
    array.each { |nils|  nils.compact! }
    # delete all empty arrays
    array.delete_if { |blanks| blanks.empty? }
  end

  # def csv_netids(student_data_array)
  #   @student_netids = []
  #   student_data_array.each do |i|
  #     if i.size > 2
  #       @netid = i[@mail_col].downcase
  #       @netid.slice! "@uci.edu"
  #       @student_netids.push(@netid)
  #     end
  #   end
  #   @student_netids.push(current_user.ucinetid)
  end

  def destroy_groups(course)
    course.groups.each do |group|
      group.destroy
    end
    destroy_group_relations(course)
  end

  def destroy_projects(course)
    course.projects.each do |project|
      destroy_project_relations(course)
      destroy_groups(course)
      project.destroy
    end
  end

  def destroy_group_relations(course)
    course.group_relations.each do |relation|
      relation.destroy
    end
  end

  def destroy_project_relations(course)
    course.project_relations.each do |relation|
      relation.destroy
    end
  end

  def destroy_roster_relations(course)
    course.rosters.each do |relation|
      relation.destroy
    end
  end

  def in_new_roster?(ucinetid)
    if User.find_by(ucinetid: ucinetid) != nil
      @student_netids = csv_netids(@student_data)
      @student_netids.each do |enrolled_student_netid|
        return true if ucinetid == enrolled_student_netid
      end
      return false
    end
  end

