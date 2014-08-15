require 'uri'
require "net/http"

class SendUserToExternalSystem

  def self.send_user
    params = {'email' => 'prashant@urbanzeak.com', 'oauth_token' => '43453454345dfgbvfdgdf', 'oauth_secret' => '34232dxdkflsdkfdslsfds' }
    x = Net::HTTP.post_form(URI.parse('http://urbanzeak-leads-processor.herokuapp.com/users'), params)
    return x
  end

end

