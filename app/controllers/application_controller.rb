class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  


before_action :webauth
require 'net/https'
require 'xmlsimple'
require 'uri'

# The WebAuth module has some default configuration constants,
# a webauth_authenticate method that can be used as a filter,
# some methods for processing the data, and a WebAuth::Check class
# that is used for making the webauth_check call

  # This causes webauth_autheticate to return true.   Useful for testing
  SKIP_AUTHENTICATION=false
  PORT     = 80
  # Setup a logger just for WebAuth
  #LOGGER=Logger.new(File/Users/christinaryder/Desktop/PSDS/INF191/partner_up/vendor/plugins/webauth/spec/webauth_spec.rb.join(RAILS_ROOT,'log','webauth.log'))

  SERVER   = 'login.uci.edu'
  
  # PORT     = 443  # Uncomment to use https for webauth_check calls

  # How long since the last webauth check before we force another check?
  RECHECK_TIME  = 6000 # 300 = 5 minutes

  # How old the login can be before the user needs to re-authenticate
  MAX_AGE  = 3600 # 3600 = 1 hour

  BASE_URI = "https://login.uci.edu/ucinetid"
  LOGIN_URI    = "https://login.uci.edu/ucinetid/webauth"
  LOGOUT_URI   = "https://login.uci.edu/ucinetid/webauth_logout"
  CHECK_URI   = "https://login.uci.edu/ucinetid/webauth_check"

  COOKIE_NAME  = "ucinetid_auth"

  ATTRIBUTES=[:ucinetid,:campus_id,:auth_host,:age_in_seconds,:uci_affiliations,:auth_fail,:error_code]
  INTEGER_ATTRIBUTES=[:age_in_seconds]
  attr_reader *ATTRIBUTES
  attr_reader :auth_key

  # Used as a filter to do a webauth_check and set a local cache of info
  # The parameters are:
  # * session_var - a session variable where the authenticated user id is stored
  # * webauth_field - the webauth_check data to store in that session variable
  def webauth
      @auth_key=cookies[COOKIE_NAME]
      http = Net::HTTP.new('login.uci.edu', 80)
      http.use_ssl = true if 80 == 443
      @results = nil
      #NOTE: if there are a lot of warnings, temporarily change VERBOSE
      # use begin/ensure to change it back
      http.start do |http|
        #request = Net::HTTP::Get.new(WebAuth::CHECK_URI + '?ucinetid_auth=' + (@auth_key || "")) # for non-xml
        @request = Net::HTTP::Get.new('https://login.uci.edu/ucinetid/webauth_check' + '?return_xml=true&ucinetid_auth=' + (@auth_key || ""))
        @response = http.request(@request)
        if @response.code != "200"
         # LOGGER.error 'WebAuth Check connection error-HTTP Response: '+response.code.to_s
          return false
        end
        @results=@response.body
      end
      @results=XmlSimple.xml_in(@results,{'ForceArray' => false})
      @results.each do |key,value|
        next unless !value.blank? and ATTRIBUTES.include?(key.to_sym)
        if INTEGER_ATTRIBUTES.include?(key.to_sym)
          value=value.to_i if INTEGER_ATTRIBUTES.include?(key.to_sym)
        else
          value.chomp!
        end
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
