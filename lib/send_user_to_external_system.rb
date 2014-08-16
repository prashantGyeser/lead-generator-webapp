require 'uri'
require "net/http"

class SendUserToExternalSystem

  def self.send_user(user_id)

    user = User.find(user_id)
    token = Token.where(user_id: user_id).last
    user_city = UserCity.where(user_id: user_id).last
    user_category = UserCategory.where(user_id: user_id).last
    city = City.find(user_city.city_id)
    category = Category.find(user_category.category_id)

    params = {:email => user.email, :oauth_token => token.oauth_token, :oauth_secret => token.oauth_secret, :city =>  city.name, :category => category.name }
    x = Net::HTTP.post_form(URI.parse(ENV['PROCESSOR_SERVER_URL'] + '/users'), params)
    return x
  end

end

