module ApplicationHelper
require 'net/http'
require 'net/https'
require 'uri'

def ohshit
url = URI.parse('http://www.it.uci.edu/help/webauth/weblogin.coldfusion.txt')
req = Net::HTTP::Get.new(url.path)
res = Net::HTTP.start(url.host, url.port) {|http|
  http.request(req)
}
 @page_content =  res.body
end


def ohshish
url = URI.parse ('https://login.uci.edu/ucinetid/webauth_check?ucinetid_auth=true')
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = (url.scheme == 'https')
request = Net::HTTP::Get.new(url.path)
request.basic_auth url.user, url.password
response = http.request(request)

@page_content = response.body

end



def cancel
  user = User.find(params[:id])

  user.status = false
  current_user.status = false
  current_user.partner1 = ""
  user.partner1 = ""

  user.save
  current_user.save
  redirect_to users_path(user)
  current_user.destroy
  Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
  yield resource if block_given?
  respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
end

end
