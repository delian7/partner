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
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    @project.save
    redirect_to(:action => 'index')
  end

  


  def update
    @project = Project.find(params[:id])
    
    if @project.update_attributes(project_params)
      flash[:notice] = "Project updated successfullly yayy :)"
      redirect_to(:action => 'index')
    else
      flash[:error] = "Project not updated. :("
      render('edit')
    end
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
    params.require(:project).permit(:name, :active, :course_id, :group_size)
  end 
  
end

