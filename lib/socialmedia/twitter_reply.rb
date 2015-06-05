class TwitterReply
  attr_accessor :message, :twitter_client, :in_reply_to

  def initialize(message, twitter_credentials, in_reply_to = '')
    @message = message
    @twitter_client = TwitterClient.new(twitter_credentials[:oauth_token], twitter_credentials[:oauth_secret]).client
    @in_reply_to = in_reply_to
  end

  def send_reply
    if is_message_valid?
      reply
    end
  end

  private
  # Message should be less than 140 characters in total
  def is_message_valid?
    if message.length >= 140
      return false
    end
    return true
  end

  def reply
    # Todo: Implement error handling
    if in_reply_to.empty?
      twitter_client.update(message)
    else
      puts "It is in the right place #{in_reply_to}"
      twitter_client.update(message, in_reply_to_tweet_id: in_reply_to)
    end
  end

end