class ProjectsController < ApplicationController
  include UsersHelper, GroupsHelper

  def index
    @projects = Project.all
  end

  def create
    if params[:courses]
      # make one project with lots of relations (project belonging to multiple courses)
      if params[:limit_scope]
        @project = Project.new(project_params)
        @project.save
        params[:courses].each do |course|
          relation = ProjectRelation.create(course_id: course, project_id: @project.id)
          relation.save
        end
        # make many projects with one relation each (individuals with identical)
      else
        params[:courses].each do |course|
          @project = Project.new(project_params)
          @project.save
          relation = ProjectRelation.create(course_id: course, project_id: @project.id)
          relation.save
        end
        if @project.save
          current_user.current_project = @project.id
          current_user.current_course = params[:courses][0]
          current_user.save
        end
      end
      flash[:notice] = "Project Created"
      redirect_to :back
    else
      flash[:alert] = "You must choose a Course to add this project to."
      redirect_to :back
    end
  end

  def reduce_groupsize
    @project = Project.find(params[:id])
    if @project.group_size > 2
      @project.group_size -= 1
      if @project.save
        flash[:notice] = "Size Reduced to #{@project.group_size}"
      end
    else
      flash[:error] = "Group size is too small, it could not be reduced"
    end
    redirect_to :back
  end

  def increase_groupsize
    @project = Project.find(params[:id])
    if @project.group_size < 7
      @project.group_size += 1
      if @project.save
        flash[:notice] = "Size Increased to #{@project.group_size}"
      end
    else
      flash[:error] = "Group size is too large, it could not be increased"
    end
    redirect_to :back
  end

  def edit
    @project = Project.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    @project.save
    redirect_to(:action => 'index')
  end

  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(project_params)
      if ProjectRelation.find_by(project_id: @project.id).nil?
        relation = ProjectRelation.create(course_id: params[:project][:course_id], project_id: @project.id)
        relation.save
      else
        if !params[:project][:course_id].nil?
          ProjectRelation.find_by(project: @project.id).update_attributes(course_id: params[:project][:course_id], project_id: @project.id)
        end
      end
      flash[:notice] = "Project updated successfully"
      redirect_to(:action => 'index')
    else
      flash[:error] = "Project could not be updated"
      render('edit')
    end
  end

  def autogroup
    students, groups = [], []
    @project = Project.find(params[:id])
    @courses = @project.courses
    @courses.each do |course|
      course.users.each do |user|
      if User.find(user).role == 0 && GroupRelation.where(user_id: user, project_id: @project).empty?
        students.push(user)
      end
    end
    end
    while !students.empty?
      name = group_namer('number', @project)
      newgroup = Group.create(name: name, project_id: @project.id)
      students.sample(@project.group_size).collect(&:id).each do |student|
        GroupRelation.create(group_id: newgroup.id, user_id: student, project_id: @project.id)
        groups.push(student)
        students.delete_if{ |student| groups.include?(student.id)}
      end
    end

    flash[:notice] = "Groups have been randomly assigned for <b>#{@project.name}</b>"
    redirect_to groups_path
  end


  def remove
    @project = Project.find(params[:id])
    @project.destroy
    ProjectRelation.where(project_id: params[:id]).each do |relation|
      relation.destroy
    end
    GroupRelation.where(project_id: params[:id]).each do |relation|
      relation.destroy
    end
    Group.where(project_id: params[:id]).each do |relation|
      relation.destroy
    end
    if @project.save
      flash[:notice] = "Project Deleted"
    else
      flash[:error] = "Project could not be deleted"
    end
    redirect_to projects_path
  end

  def clear_partnerships
    authorize current_user
    set_current_users_instance_variables
    if !@myproject.nil?
      Group.where(project_id: @myproject).each do |proj|
        proj.destroy
      end
      GroupRelation.where(project_id: @myproject).each do |proj|
        proj.destroy
      end
      flash[:notice] = "All Groups and Partnerships were cleared."
    else
      flash[:error] = "Unable to clear group relations."
    end
    redirect_to groups_path
  end


  private

  def project_params
    params.require(:project).permit(:name,:course_id, :group_size, :allow_repeat, :partnership_deadline, :evaluation_deadline)
  end

end
