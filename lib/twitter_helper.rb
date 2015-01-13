class TwitterHelper

  def search(keyword, city_latitude, city_longitude, user_id)
    client = initialize_twitter_client(user_id)

    if !client.nil?
      search_results = client.search( keyword.term, geocode: "#{city_latitude},#{city_longitude},25mi" ).collect
    end



    duplicate_count = parse_and_store_tweets(search_results, keyword.id)

    # Storing search result metrics
    keyword.last_result_count = search_results.count
    keyword.last_duplicate_count = duplicate_count

    keyword.save

  end

  def reply

  end

  private
  def initialize_twitter_client(user_id)

    user = User.find(user_id)
    token = Token.where(user_id: user_id).last

    begin
      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['TWITTER_KEY']
        config.consumer_secret     = ENV['TWITTER_SECRET']
        config.access_token        = token.oauth_token
        config.access_token_secret = token.oauth_secret
      end
    rescue => e
      Honeybadger.notify(
          :error_class   => "Twitter Initialization Error",
          :error_message => "Twitter Initialization Error: #{e.message}",
          :parameters    => {user_email: user.email}
      )
    end


  end

  def parse_and_store_tweets(search_results, keyword_id)

    duplicate_count = 0

    search_results.each do |search_result|

      unprocessed_tweet_hash = {}
      unprocessed_tweet_hash[:poster_id] = search_result.user.id
      unprocessed_tweet_hash[:poster_name] = search_result.user.name
      unprocessed_tweet_hash[:poster_screen_name] = search_result.user.screen_name
      unprocessed_tweet_hash[:poster_follower_count] = search_result.user.followers_count
      unprocessed_tweet_hash[:poster_friends_count] = search_result.user.friends_count
      unprocessed_tweet_hash[:poster_statuses_count] = search_result.user.statuses_count
      unprocessed_tweet_hash[:tweet_body] = search_result.text
      unprocessed_tweet_hash[:poster_profile_image_url] = search_result.user.profile_image_url.to_s
      unprocessed_tweet_hash[:keyword_id] = keyword_id
      unprocessed_tweet_hash[:tweet_id] = search_result.id.to_s

      unprocessed_tweet = UnprocessedTweet.new(unprocessed_tweet_hash)

      if unprocessed_tweet.save

      else
        duplicate_count = duplicate_count + 1
      end
    end

    return duplicate_count

  end


end