class ProjectsController < ApplicationController
  
  def index
    @projects = Project.all
  end
  
  def show
    @project = Project.find(params[:id])
  end
  
  def new
    @project = Project.new(:active => true)
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
  
  def update
    @project = Project.find(params[:id])
    
    if @project.update_attributes(project_params)
      redirect_to(:action => 'index')
    else
      render('edit')
    end
  end
  
  
  def project_params
    params.require(:project).permit(:name, :active, :course_id)
  end 
  
end

