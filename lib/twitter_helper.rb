class TwitterHelper

  def initialize
    # Client initialization
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
      config.access_token        = oauth_token.oauth_token
      config.access_token_secret = oauth_token.oauth_secret
    end
  end


  def search(search_term, city)

  end

  def reply

  end

end