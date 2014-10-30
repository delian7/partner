class UsersController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized, except: [:show, :index]
  require 'csv'

  def index
    @users = User.all
    @courses = Course.all
    @groups = Group.all

   
  end

  def new
    @partners = User.find(params[:id])
    @users = User.all
    #@user = User.find(params[:id])
    authorize @users
  end

  def show
    @user = User.find(params[:id])
    if user_signed_in?
      authorize @user
    else
    redirect_to :back, :alert => "Access denied."
    end
  end

  def profile
    if user_signed_in?
    authorize current_user
    else
    redirect_to :back, :alert => "Access denied."
    end
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end
  
  def set_current_course
    user = User.find(params[:id])
    authorize user
    current_user.update_attributes(secure_params)
    redirect_to users_path
  end

  def add_partnership
    authorize current_user
    user = User.find(params[:id])
    #current_group = GroupRelation.find
    
    group = GroupRelation.references(:group_relation).where(:user_id => user)

    relation1 = GroupRelation.create(:user_id=>user.id)
    relation2 = GroupRelation.create(:user_id=>current_user.id)
    if relation1.save && relation2.save
      flash[:notice] = "Added partner."
      redirect_to :back
    else
      flash[:error] = "Unable to add partner."
      redirect_to :back
    end
  end

  # Start download of csv file of partner data
  def export
      authorize User.all
      @roster = User.all
      roster_csv = CSV.generate do |csv|
      csv << ["First Name", "Last Name", "Email"]
      User.where(role: 0).each do |user|
        csv << [user.first_name, user.last_name, user.email]     
      end 
      end    
    send_data(roster_csv, :type => 'text/csv', :filename => 'groups.csv')
  end
  
  def undo_request
    authorize User.all
    user =User.find(params[:id])
    @mycourse = current_user.current_course
    @myproject = Course.find_by(:id=>current_user.current_course).active_proj 
    @my_group = GroupRelation.where(:course_id => @mycourse, :project_id => @myproject, 
      :user_id => current_user.id).limit(1).collect(&:group_id)
    @their_group = GroupRelation.where(:course_id => @mycourse, :project_id => @myproject, 
      :user_id => user.id).limit(1).collect(&:group_id)
      if GroupRelation.where(:group_id=>@my_group).collect(&:id).size <= 2
    # Delete the group
    Group.find_by_id(@my_group).destroy
    # Delete relation for current user
    GroupRelation.find_by_group_id(@my_group).destroy
    # Delete relation for user
    GroupRelation.find_by_group_id(@their_group).destroy
    flash[:notice] = "Removed request."
    else 
    flash[:error] = "Unable to remove request."
    end
  redirect_to users_path
  end

  def partnerup
    authorize User.all
    user = User.find(params[:id])
    current_project = Course.find_by_id(current_user.current_course).active_proj
    project_size = Project.find_by_id(current_project).nil? ? 0 : Project.find_by_id(current_project).size
     
    if GroupRelation.where(:course_id => current_user.current_course, 
        :user_id => current_user.id, :project_id => current_project).size > project_size
        
        flash[:error] = "Unable to add partner, you might have already requested someone"
        redirect_to users_path
    else
      
      new_group_name = current_user.first_name + "_" + user.first_name + "_partnership"
      newgroup = Group.create(:name => new_group_name)
    
    #create relation for current user which is always the requester (status=0, pending)
    GroupRelation.create(:course_id => current_user.current_course, :user_id=> current_user.id, 
      :project_id=> current_project, :status=>0, group_id: newgroup.id)
    
    # create relation for user who is being requested (status=1, requested)
    GroupRelation.create(:course_id => current_user.current_course, 
      :user_id=> user.id, :project_id=> current_project, :status=>1, group_id: newgroup.id)
      
    flash[:notice] = "Requested partner."
        redirect_to users_path
    end
  end


  def confirm
      authorize User.all
      user =User.find(params[:id])
      @mycourse = current_user.current_course
      @myproject = Course.find_by_id(@mycourse).active_proj 
      
      @my_group = GroupRelation.where(:course_id =>@mycourse, :user_id=>current_user.id, :project_id=> @myproject)        
      @their_group = GroupRelation.where(:course_id =>@mycourse, :user_id=>user.id, :project_id=> @myproject )
      
      # sets the status of the group to accepted "status=2"
      GroupRelation.find(@my_group.collect(&:id)[0]).update(:status=>2)
      GroupRelation.find(@their_group.collect(&:id)[0]).update(:status=>2)
      
      redirect_to users_path(@current_group), :flash => { :success => "Group Confirmed" }
  end

  private
  def login_params
    params.require(:user).permit(:id)
  end
  def secure_params
    params.require(:user).permit(:id, :name, :ucinetid, :role, :current_course)
  end
end
