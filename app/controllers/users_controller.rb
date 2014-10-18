class UsersController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized, except: [:show]
  require 'csv'

  def index
    @users = User.all
    @courses = Course.all
    @groups = Group.all
    #@user = User.find(params[:id])
    authorize @users
  end
  def new
    @partners = User.find(params[:id])
    @users = User.all
    #@user = User.find(params[:id])
    authorize @users
  end
  def show
    @user = User.find(params[:id])
    unless user_signed_in?
  # unless @user == current_user
    authorize @user
    redirect_to :back, :alert => "Access denied."
    end
  end

  def profile
    #unless user_signed_in?
  # unless @user == current_user
    @users = current_user
    authorize @users
    #redirect_to :back, :alert => "Access denied."
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
    redirect_to root_path
  end

  # If the user is partnered, it will clear the group of the current_user and the partner
  # If the user is unpartnered, it will partner them
  # Partnering sets status to 1 or true and fills the current_user (and their partner's) partner1 with the other person's name

  # Cancels account and ensures groups are cleared
  def cancel
    user = User.find(params[:id])
    authorize user
    user.status = false
    current_user.status = false
    current_user.partner1 = ""
    user.partner1 = ""

    user.save
    current_user.save
    redirect_to registration_path(user)
    current_user.destroy

  end

  # Clear all users partner1 columns to "" and reset statuses to 0 or false
  def clearall
    User.all.each do |user|
      user = User.find(user)
      authorize user
      user.status = false
      user.partner1 = ""
      user.save
  end
    redirect_to users_path(current_user), :alert => "All groups have been cleared."
  end

  # Start download of csv file of partner data
  def export
      authorize User.all
      @roster = User.all
      roster_csv = CSV.generate do |csv|
      csv << ["Name", "Partner"]
      User.where(role: 0).each do |user|
        csv << [user.name, user.partner1]     
      end 
      end    
    send_data(roster_csv, :type => 'text/csv', :filename => 'groups.csv')
  end

  # def confirm
  #     time = Time.new
  #     user = User.find(params[:id])
  #     authorize user
  #     user.confirmed_at = time.strftime("%Y-%m-%d %H:%M:%S")
  #     user.save
  #     redirect_to users_path(current_user), :flash => { :success => "User Confirmed" }
  # end

  def creategroup
  authorize User.all
  @group = Group.create(:course_id=>current_user.current_course, :user_id=>current_user, 
    :course_id=>current_user.current_course, :project_id=>current_user.current_project)
   if @group.save
      flash[:notice] = "Added partner."
      redirect_to root_url
    else
      flash[:error] = "Unable to add partner."
      redirect_to root_url
    end
  end

 def self.request(user, group)
    unless user == group or Grouprelation.exists?(user, group)
      transaction do
        create(:user => user, :group => group, :status => 'pending')
        create(:user => group, :group => user, :status => 'requested')
      end
    end
  end
    def self.accept(user, group)
    transaction do
      accepted_at = Time.now
      accept_one_side(user, group, accepted_at)
      accept_one_side(group, user, accepted_at)
    end
  end

  def self.accept_one_side(user, group, accepted_at)
    request = find_by_user_id_and_group_id(user, group)
    request.status = 'accepted'
    request.accepted_at = accepted_at
    request.save!
  end

  def add_to_group
    authorize current_user
    user = User.find(params[:id])
    #current_group = GroupRelation.find
    group = GroupRelation.references(:group_relation).where(:user_id => user)
    new_relation = GroupRelation.create(:group_id=>"1", :user_id=>user.id)
    if new_relation.save
      flash[:notice] = "Added partner."
      redirect_to root_url
    else
      flash[:error] = "Unable to add partner."
       redirect_to users_path
    end
  end
    def create_group
    user = User.find(params[:id])
    @group = Group.create(:group_id=>user.group_id, :user_id=>current_user)
    if @group.save
      flash[:notice] = "Added partner."
      redirect_to root_url
    else
      flash[:error] = "Unable to add partner."
      redirect_to root_url
    end
  end
  def ungroup
    @group = current_user.groups.find(params[:id])
    @group.destroy
    flash[:notice] = "Removed group."
    redirect_to current_user
  end




  private
  def secure_params
    params.require(:user).permit(:role, :current_course)
  end
end
