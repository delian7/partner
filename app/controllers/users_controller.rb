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
    # mycourse = Course.find_by_id(params[:id])

    mycourse = Course.find_by_id(current_user.current_course)
    myproject= Project.find_by_id(current_user.current_project)

    roster_csv = CSV.generate do |csv|
      mycourse.projects.each do |myproject|
        grouped=[]
        users=[]
        csv << ["Project: #{myproject.name}", "Course: #{mycourse.course_title}", "Quarter: #{mycourse.quarter}"]
        csv << ["Instructor: " + mycourse.instructor, "Downloaded by: " + current_user.first_name + " " + current_user.last_name, "Date: #{Time.now.strftime("%m/%d/%Y")}"]
        csv << ["Time: #{Time.now.strftime("%I:%M %p")}", "Total Teams: #{myproject.groups.uniq.size}", "Total Students: #{mycourse.users.where(role:0).size}"]
        csv << ["Grouped: " , "Ungrouped:"]
        GroupRelation.where(project_id: myproject.id, status:2).collect(&:user_id).uniq.each do |id|
          if User.find_by_id(id).role == 0
            grouped.push(User.find_by_id(id)) if !grouped.include?(User.find_by_id(id))
          end
        end
        mycourse.users.each do |id|
          if id.role == 0
            users.push(id)
          end
        end
        ungrouped = users - grouped

        count = -1
        if grouped.size() >= ungrouped.size()
          grouped.each do |i|
            count+=1
            name = i.last_name + ", " + i.first_name
            secondname = ungrouped[count].last_name + ", " + ungrouped[count].first_name if count < ungrouped.size()
            count < ungrouped.size() ? csv << [name,secondname] : csv << [name]
          end
        else
          ungrouped.each do |i|
            count+=1
            name = i.last_name + ", " + i.first_name
            secondname = grouped[count].last_name + ", " + grouped[count].first_name if count < grouped.size()
            count <= grouped.size() ? csv << [secondname,name] : csv << ["",name]
          end
        end
      end

    end
    send_data(roster_csv, type:  'text/csv', filename:  "#{Date.today}_leftover_students.csv")


  end



  def eval_gen
    User.all.each do |user|
      eval_generator(user)
    end
    redirect_to users_path
  end

  def phone_gen
    User.all.each do |user|
      phone_generator(user)
    end
    redirect_to root_path
  end

  def avatar_gen
    User.all.each do |user|
      avatar_generator(user)
    end
    redirect_to users_path
  end

  def avail_gen
    User.all.each do |user|
      availability_generator(user)
    end
    redirect_to users_path
  end

  def desc_gen
    User.all.each do |user|
      description_generator(user)
    end
    redirect_to users_path
  end

  def gen
    User.all.each do |user|
      description_generator(user)
      availability_generator(user)
      avatar_generator(user)
      eval_generator(user)
      phone_generator(user)
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
