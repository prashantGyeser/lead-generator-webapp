class ParseSearchResults

  def twitter(search_results, keyword_id)
    duplicate_count = 0

    search_results.each do |search_result|
      single_tweet(search_result, keyword_id)
    end

    return duplicate_count
  end


  def single_tweet(tweet, keyword_id)

    duplicate_count = 0

    unprocessed_tweet_hash = {}
    unprocessed_tweet_hash[:poster_id] = tweet.user.id
    unprocessed_tweet_hash[:poster_name] = tweet.user.name
    unprocessed_tweet_hash[:poster_screen_name] = tweet.user.screen_name
    unprocessed_tweet_hash[:poster_follower_count] = tweet.user.followers_count
    unprocessed_tweet_hash[:poster_friends_count] = tweet.user.friends_count
    unprocessed_tweet_hash[:poster_statuses_count] = tweet.user.statuses_count
    unprocessed_tweet_hash[:tweet_body] = tweet.text
    unprocessed_tweet_hash[:poster_profile_image_url] = tweet.user.profile_image_url.to_s
    unprocessed_tweet_hash[:keyword_id] = keyword_id
    unprocessed_tweet_hash[:tweet_id] = tweet.id.to_s
    unprocessed_tweet_hash[:geo_enabled] = (tweet.user.geo_enabled?).to_s
    unprocessed_tweet_hash[:location] = tweet.user.location.to_s

    unprocessed_tweet = UnprocessedTweet.new(unprocessed_tweet_hash)

    begin
      if unprocessed_tweet.save

      else
        duplicate_count = duplicate_count + 1
      end
    rescue => e
      Honeybadger.notify(
          :error_class   => "Tweet parse and store error",
          :error_message => "Tweet parse and store error: #{e.message}",
          :parameters    => unprocessed_tweet
      )
    end

  end

end