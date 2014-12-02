class TwitterHelper

  def search(keyword, city_latitude, city_longitude)
    client = initialize_twitter_client
    search_results = client.search( keyword.term, geocode: "#{city_latitude},#{city_longitude},25mi" ).collect

    parse_and_store_tweets(search_results, keyword.id)

  end

  def reply

  end

  private
  def initialize_twitter_client
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
      config.access_token        = '2431831016-cQXzpH7eoR7iSBO2A3nb7OLWzNcPBGngAeIxlEz'
      config.access_token_secret = '2iIxN9FmebV6cHLNZxugz16z3m9qogJIKhc6ubkgHfWM7'
    end
  end

  def parse_and_store_tweets(search_results, keyword_id)
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

      unprocessed_tweet = UnprocessedTweet.create(unprocessed_tweet_hash)

    end
  end


end