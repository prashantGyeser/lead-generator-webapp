require 'uri'
require "net/http"

class SendToProcessor

  def self.send_user(user_id)
    user = User.find(user_id)
    params = {:email => user.email}
    x = Net::HTTP.post_form(URI.parse(ENV['PROCESSOR_SERVER_URL'] + '/users'), params)
    return x
  end

  def self.send_lead_stream(user_id, lead_stream)

  end

end

