class UsersController < ApplicationController
  
  helper_method :course_ids, :requested?, :requester?
  before_filter :authenticate_user!
  after_action :verify_authorized, except: [:show, :index]
  require 'csv'

  def index
    # @user = User.find(params[:id])
    @users = User.all
    @mycourse = current_user.current_course 
    @myproject = current_user.current_project
    @mygroup = GroupRelation.where(:project_id => @myprojects, :user_id => current_user.id).pluck(:group_id)
    @current_user_relations = GroupRelation.find_by_group_id(@mygroup) 
   
  end

  def course_ids(user)
    user.courses.pluck(:id)
  end

  def requested?(user)
        if GroupRelation.where(:project_id => @myprojects, :user_id => current_user.id, :group_id=>@mygroup).pluck(:status)[0] == 1
      return current_user
        elsif GroupRelation.where(:project_id => @myprojects, :user_id => user.id, :group_id=>@mygroup).pluck(:status)[0] == 1
      return user
    end
  end

  def requester?(user)
    if GroupRelation.where(:project_id => @myprojects, :user_id => current_user.id, :group_id=>@mygroup).pluck(:status)[0] == 0
      return current_user
    elsif GroupRelation.where(:project_id => @myprojects, :user_id => user.id, :group_id=>@mygroup).pluck(:status)[0] == 0
      return user
    end
  end

  def new
    @partners = User.find(params[:id])
    @users = User.all
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
    redirect_to groups_path
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
    @their_group = GroupRelation.where(:course_id => @mycourse, :project_id => @myproject, 
      :user_id => user.id).limit(1).collect(&:group_id)
      if GroupRelation.where(:group_id=>@my_group).collect(&:id).size <= 2
    # Delete the group
    Group.find_by_id(@mygroup).destroy
    # Delete relation for current user
    GroupRelation.find_by_group_id(@mygroup).destroy
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
    
    # current_project only gets the first project. #TODO FIX! 
    allowed_group_size = Project.find_by_id(current_user.current_project).group_size
    current_group_size = GroupRelation.where(project_id: current_user.current_project, course_id: current_user.current_course).uniq.pluck(:user_id).size
     
    if current_group_size > allowed_group_size - 1
        flash[:error] = "Unable to add partner, you might have already requested someone."
        redirect_to users_path
    else
      
      newgroup = Group.create(:name => current_user.first_name + "_" + user.first_name + "_partnership")
    
    #create relation for current user which is always the requester (status=0, pending)
    GroupRelation.create(:course_id => current_user.current_course, :user_id=> current_user.id, 
      :project_id=> current_user.current_project, :status=>0, group_id: newgroup.id)
    
    # create relation for user who is being requested (status=1, requested)
    GroupRelation.create(:course_id => current_user.current_course, 
      :user_id=> user.id, :project_id=> current_user.current_project, :status=>1, group_id: newgroup.id)
        
   flash[:notice] = "Requested partner."
        redirect_to users_path
    end
  end

  def set_current_project
    user = User.find(params[:id])
    authorize user
    current_user.update_attributes(secure_params)
    redirect_to users_path
  end

  def confirm
      authorize User.all
      user =User.find(params[:id])
      @mycourse = current_user.current_course
      @my_group = GroupRelation.where(:course_id =>@mycourse, :user_id=>current_user.id, :project_id=> @myproject)        
      @their_group = GroupRelation.where(:course_id =>@mycourse, :user_id=>user.id, :project_id=> @myproject )
      
      # sets the status of the group to accepted "status=2"
      GroupRelation.find(@my_group.collect(&:id)[0]).update(:status=>2)
      GroupRelation.find(@their_group.collect(&:id)[0]).update(:status=>2)
      
      redirect_to users_path(@current_group), :flash => { :success => "Group Confirmed" }
  end
    def ignore
    authorize User.all
    user =User.find(params[:id])
    @mycourse = current_user.current_course
    @myproject = current_user.current_project
    @their_group = GroupRelation.where(:course_id => @mycourse, :project_id => @myproject, 
      :user_id => user.id).limit(1).collect(&:group_id)
      if GroupRelation.where(:group_id=>@my_group).collect(&:id).size <= 2
    # Delete the group
    Group.find_by_id(@mygroup).destroy
    # Delete relation for current user
    GroupRelation.find_by_group_id(@mygroup).destroy
    # Delete relation for user
    GroupRelation.find_by_group_id(@their_group).destroy
    flash[:notice] = "Removed request."
    else 
    flash[:error] = "Unable to remove request."
    end
  redirect_to users_path
  end

  private
  def login_params
    params.require(:user).permit(:id)
  end
  def secure_params
    params.require(:user).permit(:id, :name, :ucinetid, :role, :current_course, :current_project)
  end
end
