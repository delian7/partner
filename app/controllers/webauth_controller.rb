class WebauthController < ApplicationController

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
  
  def index
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

end



  def webauth_authenticate(opts)
    return true if SKIP_AUTHENTICATION
    session_key=opts[:session_key]
    webauth_data=opts[:webauth_data]
    auth_key=cookies[COOKIE_NAME]
    # This is the default key WebAuth sets to test for cookies
    auth_key=nil if auth_key == 'no_key'
    unless auth_key
      redirect_to_webauth_login
      return
    end
   
    # If a webauth_check has already been done and is the same key, 
    # then skip doing a webauth_check again
    if session[:webauth]
      if session[:webauth][:expires] < Time.now
        redirect_to_webauth_login
        return
      end
      return true if session[:webauth][:auth_key] == auth_key
    end
    @check=Check.new(auth_key)
    unless @check.valid?
      redirect_to_webauth_login
      return
    end

    # made it this far, must be okay
   # LOGGER.warn 'WebAuth Successful for: '+@check.ucinetid.to_s
    set_webauth_session(session_key,webauth_data)
    return true
  end

  # Set the session variables for the webauth cache and for the authenticated id
  def set_webauth_session(session_var,webauth_field)
    session[:webauth]={:auth_key => @ucinetid, :expires => Time.now+RECHECK_TIME}
    session[session_var]=@check.send(webauth_field)
    return true
  end

  # clear out the webauth cache and redirect the browser to the webauth login
  def redirect_to_webauth_login
    session[:webauth]=nil

    redirect_to LOGIN_URI+'?return_url='+Rack::Utils.escape(request_url)
  end

  # piece together the URL requested.  this doesn't work too well in tests
  def request_url
    #FIXME REQUEST_URI shouldn't be the right variable, but it seems to work
    "#{request.env['rack.url_scheme']}://#{request.env['HTTP_HOST']}#{request.env['REQUEST_URI']}"
  end

  # Used for getting and validating webauth_check info
  class Check 
    # These are the webauth_check attributes used by this class
    ATTRIBUTES=[:ucinetid,:campus_id,:auth_host,:age_in_seconds,:uci_affiliations,:auth_fail,:error_code]
    INTEGER_ATTRIBUTES=[:age_in_seconds]
    attr_reader *ATTRIBUTES
    attr_reader :auth_key

    # A webauth_check call needs an auth_key
    def initialize(auth_key)
      @auth_key=auth_key
    end
    
    # Do an HTTP GET to fetch the webauth_check info
    #
    # This uses XML although it doesn't really have to
    def get_check_results
      http = Net::HTTP.new(WebAuth::SERVER, WebAuth::PORT)
      http.use_ssl = true if WebAuth::PORT == 443
      results = nil
      #NOTE: if there are a lot of warnings, temporarily change VERBOSE
      # use begin/ensure to change it back
      http.start do |http|
        #request = Net::HTTP::Get.new(WebAuth::CHECK_URI + '?ucinetid_auth=' + (@auth_key || "")) # for non-xml
        request = Net::HTTP::Get.new(WebAuth::CHECK_URI + '?return_xml=true&ucinetid_auth=' + (@auth_key || ""))
        response = http.request(request)
        if response.code != "200"
         # LOGGER.error 'WebAuth Check connection error-HTTP Response: '+response.code.to_s
          return false
        end
        results=response.body
      end
      return results
    end

    # Parse the webauth_check data and store it in the WebAuth::Check object
    def parse_and_load_results(check_results)
     

    # Uses the auth_key to get the data, parse it, and make sure it complies with the default configuration timeouts, has proper fields, etc
    def valid?
      parse_and_load_results(get_check_results)
      error=nil
      error='EMPTY UCINETID' if @ucinetid.blank?
      error='EMPTY CAMPUSID' if @campus_id.blank?
      error='TIMEOUT' if !@age_in_seconds or @age_in_seconds > MAX_AGE
#      error='AUTH CLIENT MISMATCH' unless @auth_host=request.remote_ip
      if error
        #LOGGER.warn "#{Time.now} WebAuth Check Error: #{error}" 
        return false
      end
      return true
    end

  end
end
