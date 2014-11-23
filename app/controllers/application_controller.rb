class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
include Pundit

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :startup, :nil_check

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  require 'net/https'
  require 'xmlsimple'
  require 'uri'
  require 'csv'

  # The WebAuth module has some default configuration constants,
  # a webauth_authenticate method that can be used as a filter,
  # some methods for processing the data, and a WebAuth::Check class
  # that is used for making the webauth_check call

  COOKIE_NAME  = "ucinetid_auth"
  attr_reader :auth_key

  def startup
      @auth_key=cookies[COOKIE_NAME]
      http = Net::HTTP.new('login.uci.edu', 80)
      if @auth_key == nil
        return
      end
      @results = nil
      http.start do |http|
        request = Net::HTTP::Get.new('https://login.uci.edu/ucinetid/webauth_check' + '?return_xml=true&ucinetid_auth=' + (@auth_key || ""))
        response = http.request(request)
        @results = response.body
      end
      @results=XmlSimple.xml_in(@results,{'ForceArray' => false})
      @results.each do |key,value|
        next unless !value.blank?
          value.chomp!
          instance_variable_set('@'+key,value)
      end
        return @results
    end

  def nil_check
    if Project.where(course_id: 0).empty?
      proj = Project.create(id: 0, course_id: 0)
    end
    if Project.where(id: 0).empty?
      proj = Project.find_by(course_id: 0)
      proj.id = 0
      proj.save
    end
    if Course.where(id: 0).empty?
      course = Course.create(course_title: "")
      course.id = 0
      course.course_title= ""
      course.save
    end
  end


  protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) << :id
  #   devise_parameter_sanitizer.for(:account_update) << :id
  # end
 def configure_permitted_parameters
    devise_parameter_sanitizer.for(:user) { |u| u.permit(:id) }
  end

  private

  def user_not_authorized
    flash[:alert] = "Access denied."
    redirect_to (request.referrer || root_path)
  end

  def secure_params
      params.require(:user).permit(:current_course)
  end
end