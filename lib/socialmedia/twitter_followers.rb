class TwitterFollowers
  attr_reader :twitter_client

  def initialize(oauth_token, oauth_secret)
    @twitter_client = TwitterClient.new(oauth_token, oauth_secret).client
  end

  def get_followers
    twitter_client.follower_ids
  end

end