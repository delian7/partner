class ProjectsController < ApplicationController
  
  def index
    @projects = Project.all
  end
  
  def show
    @project = Project.find(params[:id])
  end
  
  def new
    #@project = Project.new(:active => true)
  end
  
  def create
    @project = Project.new(project_params)
    
    if @project.save
      redirect_to(:action => 'index')
    else
      render('new')
    end
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
      flash[:notice] = "Project updated successfully"
      redirect_to(:action => 'index')
    else
      flash[:error] = "Project could not be updated"
      render('edit')
    end
  end

    def autogroup
    students=[]
    groups=[]
    @project = Project.find(params[:id])
    relations = Roster.where(course_id: @project.course_id).collect(&:user_id)
    relations.each do |user|
      students.push(User.find(user))
    end
    times = Roster.where(course_id: @project.course_id).size.divmod @project.group_size


    for i in 1..times[0] 
        case @project.name_gen 
       when 0
        groupname = "Team " + Group.where(project_id: project.id).size + 1
       when 1
        groupname = Faker::Hacker.ingverb.titlecase + " " + Faker::Hacker.adjective.titlecase
       when 2
        groupname = Faker::Team.creature.titlecase
       when 3
        groupname = Faker::Team.color.titlecase
     end
     newgroup = Group.create(name: "#{groupname}")
      students.sample(@project.group_size).collect(&:id).each do |student|
        GroupRelation.create(course_id: @project.course_id, group_id: newgroup.id, user_id: student, project_id: @project.id)
      end
    end
    for i in 1..times[1] 
        case @project.name_gen
       when 0
        groupname = "Team " + Group.where(project_id: project.id).size + 1
       when 1
        groupname = Faker::Hacker.ingverb.titlecase + " " + Faker::Hacker.adjective.titlecase
       when 2
        groupname = Faker::Team.creature.titlecase
       when 3
        groupname = Faker::Team.color.titlecase
     end
     newgroup = Group.create(name: "#{groupname}")
      students.sample(times[1]).collect(&:id).each do |student|
        GroupRelation.create(course_id: @project.course_id, group_id: newgroup.id, user_id: student, project_id: @project.id)
    end
end
redirect_to(:action => 'index')
end


  def remove
    @project = Project.find(params[:id])
    @project.destroy
    if @project.save
      flash[:notice] = "Project Deleted"
    else
      flash[:error] = "Project could not be deleted"
    end
    redirect_to(:action => 'index')
  end
  
  private 
  
  def project_params
    params.require(:project).permit(:name, :active, :autogroup, :course_id, :group_size, :allow_repeat, :name_gen)
  end 
  
end