class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :startup

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

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

  def set_course
    authorize User.all
    @course = Course.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_to courses_path, :notice => "course updated."
    else
      redirect_to courses_path, :alert => "Unable to update course."
    end

    if user_signed_in? && !current_user.courses.blank?
      @curr_course = Course.find(params[:id])
      current_user.save
    end
    redirect_to root_path
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
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
