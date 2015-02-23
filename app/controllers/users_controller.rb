class Array
  def safe_transpose(csv)
    require 'csv'
    result = []
    max_size = self.max { |a,b| a.size <=> b.size }.size
    max_size.times do |i|
      result[i] = Array.new(2)
      self.each_with_index { |r,j| r[i].nil? ? (result[i][j] = r[i]) : (result[i][j] = (r[i].first_name + " " + r[i].last_name)) }
    end
    result
  end
end


class UsersController < ApplicationController
  before_filter :authenticate_user!
  # before_filter :admin_only, :except => :show
  helper_method :teammates?, :in_group_for?, :classmates?, :previously_partnered?
  include UsersHelper, GroupsHelper
  # after_action :verify_authorized, except: [:show, :index]
  require 'csv'


  def profile
  end

  def index
    @users = User.all
    set_current_users_instance_variables
    if @myproject.nil?
      set_current_project_course(current_user, Project.find(0), Course.find(0))
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  def set_current_course
    authorize User.find(params[:id])
    current_user.update_attributes(secure_params)
    set_current_users_instance_variables
    # @current_projects = Project.where(course_id: @mycourse.id)
    @current_projects = Course.find_by_id(current_user.current_course).projects

    if @current_projects.exists?
      current_user.update_attributes(current_project: @current_projects.first.id)
    else
      current_user.update_attributes(current_project: 0)
    end
    redirect_to :back

  end

  def set_current_project
    user = User.find(params[:id])
    authorize user
    current_user.update_attributes(secure_params)
    redirect_to :back
  end

  # Start download of csv file of partner data
  def export_groups
    authorize current_user
    mycourse = Course.find_by_id(current_user.current_course)
    myproject= Project.find_by_id(current_user.current_project)
    roster_csv = CSV.generate do |csv|
      header=[]
      header.push()
      csv << ["Project: #{myproject.name}", "Course: #{mycourse.course_title}", "Quarter: #{mycourse.quarter}"]
      csv << ["Instructor: " + mycourse.instructor, "Downloaded by: " + current_user.first_name + " " + current_user.last_name, "Date: #{Time.now.strftime("%m/%d/%Y")}"]
      csv << ["Time: #{Time.now.strftime("%I:%M %p")}", "Total Teams: #{myproject.groups.uniq.size}", "Total Students: #{mycourse.users.where(role:0).size}"]

      groupids = GroupRelation.where(project_id:current_user.current_project).collect(&:group_id).uniq
      groupids.each do |group|
        @group = Group.find(group)
        members = []
        members.push(@group.name)
        GroupRelation.where(group_id: group, status:2).collect(&:user_id).each do |i|
          user = User.find(i)
          name = user.last_name + ", " + user.first_name
          members.push(name)
        end
        csv << members
      end
    end
    send_data(roster_csv, type:  'text/csv', filename: "#{mycourse.course_code}_groups.csv")
  end
  # Start download of csv file of partner data
  def export_ungrouped
    authorize current_user
    grouped=[]
    users=[]
    mycourse = Course.find_by_id(current_user.current_course)
    myproject= Project.find_by_id(current_user.current_project)

    roster_csv = CSV.generate do |csv|
      csv << ["Project: #{myproject.name}", "Course: #{mycourse.course_title}", "Quarter: #{mycourse.quarter}"]
      csv << ["Instructor: " + mycourse.instructor, "Downloaded by: " + current_user.first_name + " " + current_user.last_name, "Date: #{Time.now.strftime("%m/%d/%Y")}"]
      csv << ["Time: #{Time.now.strftime("%I:%M %p")}", "Total Teams: #{myproject.groups.uniq.size}", "Total Students: #{mycourse.users.where(role:0).size}"]
      csv << ["Grouped: " , "Ungrouped:"]
      GroupRelation.where(project_id: myproject.id, status:2).collect(&:user_id).uniq.each do |id|
        if User.find_by_id(id).role == 0
          grouped.push(User.find_by_id(id))
        end
      end
      mycourse.users.each do |id|
        users.push(id)
      end
      ungrouped = users - grouped

      array = [grouped, ungrouped]



      csv << array.safe_transpose(csv)

      # if grouped.size() >= ungrouped.size()
      #   grouped.each do |i|
      #     name = i.last_name + ", " + i.first_name
      #     secondname = ungrouped[count].last_name + ", " + ungrouped[count].first_name if count < ungrouped.size()
      #     count < ungrouped.size() ? csv << [secondname, name] : csv << [name]
      #   end
      # else
      #   ungrouped.each do |i|
      #     name = i.last_name + ", " + i.first_name
      #     secondname = grouped[count].last_name + ", " + grouped[count].first_name if count < grouped.size()
      #     count < grouped.size() ? csv << [secondname, name] : csv << ["",name]
      #   end
      # end
    end
    send_data(roster_csv, type:  'text/csv', filename:  "#{mycourse.course_code}_leftover_students.csv")
  end

  def send_request
    user = User.find(params[:id])
    authorize user
    set_current_users_instance_variables

    if @current_group_size >= @allowed_group_size
      flash[:error] = "Unable to send request, you have too many pending requests."
    else
      @allowed_group_size > 2 ? group_namer("random", @myproject) : group_namer("partner", @myproject)
      if @mygroup.nil?
        newgroup = Group.create(name: @groupname, course_id: @mycourse.id, project_id: @myproject.id)
        #create relation for current user
        current_user_relation = GroupRelation.create(user_id: current_user.id, project_id: @myproject.id, status: 2, group_id: newgroup.id)
      else
        newgroup = Group.find_by_id(@mygroup)
      end
      # create relation for user who is being requested (status=1, requested)
      user_relation = GroupRelation.create(user_id: user.id, project_id: @myproject.id, status: 1, group_id: newgroup.id)
      flash[:notice] = "Requested <b>#{user.first_name} #{user.last_name}</b> to your group: <b>#{newgroup.name}</b> "
    end
    redirect_to users_path
  end

  private

  def admin_only
    unless current_user.role == 3
      redirect_to :back, :alert => "Access denied."
    end
  end
  def secure_params
    params.require(:user).permit(:id, :avatar, :description, :availability, :role, :current_course, :current_project, :phone)
  end
end
