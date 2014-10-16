class GroupsController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized, except: [:show]
  require 'csv'

  def index
    @users = User.all
    @courses = Course.all
    @groups = Group.all
    #@group = group.find(params[:id])
    authorize User.all
  end
  def new
    @groups = Group.all
    #@group = group.find(params[:id])
    authorize User.all
  end
  def show
    @group = group.find(params[:id])
    unless group_signed_in?
  # unless @group == current_group
    authorize User.all
    redirect_to :back, :alert => "Access denied."
    end
  end

  def profile
  	@group = current_group
    authorize User.all
  end

  def update
    @group = group.find(params[:id])
    authorize User.all
    if @group.update_attributes(secure_params)
      redirect_to groups_path, :notice => "Group updated."
    else
      redirect_to groups_path, :alert => "Unable to update group."
    end
  end

  def destroy
    group = group.find(params[:id])
    authorize User.all
    unless group == current_group
      group.destroy
      redirect_to groups_path, :notice => "Group deleted."
    else
      redirect_to groups_path, :notice => "Can't delete yourself."
    end
  end


#This does nothing for now, will use code syntax for reference when doing request stuff
def flop
    group = group.find(params[:id])
    authorize User.all
    if current_group.partner1 == ""
      current_group.partner1 = group.name
      group.partner1 = current_group.name
    else
      current_group.partner1 = ""
      group.partner1 = ""
    end
      group.save
      current_group.save
      redirect_to groups_path(current_group)
      # Delay Mailer to reduce flop lag
      #ChangeMailer.delay.send_change_message(group.email)
      # Regular Mailer no delay
  ChangeMailer.send_change_message(group.email).deliver
  end

  # Remove yourself from "this" group whatever id is param
  def removeself
    group = group.find(params[:id])
    authorize User.all
	group.destroy #<< this is crap fix later
    redirect_to registration_path(group)
    current_group.destroy

  end

  # Clear all groups partner1 columns to "" and reset statuses to 0 or false
  def resetgroups
  	authorize User.all
    Course.all.each do |t|
      group = Group.find(course) #<< this is crap fix later
      group.destroy
      group.save
  end
    redirect_to groups_path(current_group), :alert => "All groups have been cleared."
  end

  # Start download of csv file of Groups for this Course data
  def export
      authorize User.all
      @roster = Group.all
      roster_csv = CSV.generate do |csv|
      csv << ["Name", "Partner"]
      group.where(role: 0).each do |group|
        csv << [group.name, group.partner1]     
      end 
      end    
    send_data(roster_csv, :type => 'text/csv', :filename => 'groups.csv')
  end

  def confirm
      time = Time.new
      group = group.find(params[:id])
      authorize User.all
      group.confirmed_at = time.strftime("%Y-%m-%d %H:%M:%S")
      group.save
      redirect_to groups_path(current_group), :flash => { :success => "group Confirmed" }
  end

  def creategroup
  authorize User.all
  @group = Group.create(:group_id=>current_group.current_group, :group_id=>current_group, 
    :group_id=>current_group.current_group, :project_id=>current_group.current_project)
   if @group.save
      flash[:notice] = "Added partner."
      redirect_to root_url
    else
      flash[:error] = "Unable to add partner."
      redirect_to root_url
    end
  end



  def group
    @group = current_group.grouprelation.build(:group_id => params[:group_id])
    if @group.save
      flash[:notice] = "Added partner."
      redirect_to root_url
    else
      flash[:error] = "Unable to add partner."
      redirect_to root_url
    end
  end
  
  def ungroup
    @group = current_group.groups.find(params[:id])
    @group.destroy
    flash[:notice] = "Removed group."
    redirect_to current_group
  end




  private
  def secure_params
    params.require(:group).permit(:role)
  end
end