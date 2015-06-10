class TwitterStatuses
  attr_accessor :twitter_client, :tweet_status_results

  def initialize(twitter_credentials)
    @twitter_client = TwitterClient.new(twitter_credentials[:oauth_token], twitter_credentials[:oauth_secret]).client
    @tweet_status_results = {}
  end

  # Data return format
  # {retweet_count: Integer, favorites_count: Integer, user_mentions: Twitter::User}
  def tweet_status(tweet_id)
    get_status(twitter_client.status(tweet_id))
    return tweet_status_results
  end

  private
  def get_status(status)
    set_retweet_count(status)
    set_favorites_count(status)
    set_user_mentions(status)
  end

  def set_retweet_count(status)
    tweet_status_results[:retweet_count] = status.retweet_count
  end

  def set_favorites_count(status)
    tweet_status_results[:favorites_count] = status.favorites_count
  end

  def set_user_mentions(status)
    tweet_status_results[:user_mentions] = status.user_mentions
  end


end