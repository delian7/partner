class ApplicationController < ActionController::Base
  include Pundit

  before_action :webauth

  require 'net/https'
  require 'xmlsimple'
  require 'uri'

  # The WebAuth module has some default configuration constants,
  # a webauth_authenticate method that can be used as a filter,
  # some methods for processing the data, and a WebAuth::Check class
  # that is used for making the webauth_check call

  COOKIE_NAME  = "ucinetid_auth"
  ATTRIBUTES=[:ucinetid,:campus_id,:auth_host,:age_in_seconds,:uci_affiliations,:auth_fail,:error_code]
  INTEGER_ATTRIBUTES=[:age_in_seconds]
  attr_reader *ATTRIBUTES
  attr_reader :auth_key

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
