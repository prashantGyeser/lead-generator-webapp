class TwitterStatusUpdates
  attr_reader :twitter_client

  def initialize(twitter_credentials)
    @twitter_client = TwitterClient.new(twitter_credentials[:oauth_token], twitter_credentials[:oauth_secret]).client
  end


  def get_user_statuses(screen_name)
    @twitter_client.user_timeline(screen_name)
  end

end