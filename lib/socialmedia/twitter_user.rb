class TwitterUser
  attr_reader :twitter_client

  def initialize(oauth_token, oauth_secret)
    @twitter_client = TwitterClient.new(oauth_token, oauth_secret).client
  end

  def lookup(twitter_user_ids)
    get_user_info(twitter_user_ids)
  end

  private
  def get_user_info(user_ids)
    twitter_client.users(user_ids)
  end

end