class ApplicationController < ActionController::Base
  include Pundit

  before_action :startup


  require 'net/https'
  require 'xmlsimple'
  require 'uri'

  # The WebAuth module has some default configuration constants,
  # a webauth_authenticate method that can be used as a filter,
  # some methods for processing the data, and a WebAuth::Check class
  # that is used for making the webauth_check call

  COOKIE_NAME  = "ucinetid_auth"
  attr_reader :auth_key

  def startup
      @enrolled_courses={}
      @current_groups={}
      @course_groups = Group.all.collect(&:id)

       @groups = Group.joins(:users).where(users: { campus_id: current_user })
          @groups.each do |t|
           @current_groups[t.id] = t.id
          end
      @course_ids = Course.all.collect(&:id)
      
          @enrolls = Course.joins(:users).where(users: { campus_id: current_user })
          @enrolls.each do |t|
           @enrolled_courses[t.id] =  t.course_title
          end

      @auth_key=cookies[COOKIE_NAME]
      http = Net::HTTP.new('login.uci.edu', 80)
      http.use_ssl = true if 80 == 443
      @results = nil
      http.start do |http|
        @request = Net::HTTP::Get.new('https://login.uci.edu/ucinetid/webauth_check' + '?return_xml=true&ucinetid_auth=' + (@auth_key || ""))
        @response = http.request(@request)
        @results=@response.body
      end
      @results=XmlSimple.xml_in(@results,{'ForceArray' => false})
      @results.each do |key,value|
        next unless !value.blank?
          value.chomp!
          instance_variable_set('@'+key,value)
      end
        return @results
    end



  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected


  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end


  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "Access denied."
    redirect_to (request.referrer || root_path)
  end

end
