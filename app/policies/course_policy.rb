class CoursePolicy < ApplicationPolicy
  attr_reader :user, :record
    def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end
  
  def set_course?
    true
  end 
   
end
