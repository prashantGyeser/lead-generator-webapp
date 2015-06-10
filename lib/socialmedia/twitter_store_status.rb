class TwitterStoreStatus

  def store_status(status, tweet_reply)
    tweet_reply.retweet_count = status[:retweet_count]
    tweet_reply.favorites_count = status[:favorites_count]
    tweet_reply.save
  end

end