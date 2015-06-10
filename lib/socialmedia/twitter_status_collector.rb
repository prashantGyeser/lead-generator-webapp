class TwitterStatusCollector
  attr_reader :subscription_helper, :twitter_store_status

  def initialize
    @subscription_helper = SubscriptionHelper.new
    @twitter_store_status = TwitterStoreStatus.new
  end


  def all
    iterate_replies
  end

  private
  def iterate_replies
    TweetReply.find_each do |tweet_reply|
      store_status(tweet_reply)
    end
  end

  def store_status(tweet_reply)
    user_token = get_user_token(tweet_reply)
    if user_active?(user_token[:user])
      twitter_store_status(get_status(user_token[:token], tweet_reply), tweet_reply)
    end
  end

  def get_user_token(tweet_reply)
    user_id = tweet_reply.user_id
    user_and_token = {}
    user_and_token[:user] = user(user_id)
    user_and_token[:token] = token(user_id)
    return user_and_token
  end

  def get_status(token, tweet_reply)
    if !tweet_reply.reply_tweet_id.nil?
      twitter_statuses(token).tweet_status(tweet_reply.reply_tweet_id)
    end
  end

  def user_active?(user)
    subscription_helper.is_active?(user)
  end

  def user(user_id)
    User.find(tweet_reply.user_id)
  end

  def token(user_id)
    Token.find(user_id).last
  end

  def twitter_statuses(token)
    TwitterStatuses.new(token)
  end

end