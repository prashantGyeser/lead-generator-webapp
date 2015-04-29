class ParseSearchResults

  def twitter(search_results, keyword_id)
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
      unprocessed_tweet_hash[:geo_enabled] = search_result.user.geo_enabled.to_s

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


    return duplicate_count
  end

end