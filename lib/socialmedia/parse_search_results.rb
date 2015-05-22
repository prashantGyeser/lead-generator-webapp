require 'country_helper'

class ParseSearchResults

  def initialize
    @country_helper = CountryHelper.new
  end

  def twitter(search_results, keyword_id, search_type)
    duplicate_count = 0

    search_results.each do |search_result|
      single_tweet(search_result, keyword_id,search_type)
    end

    return duplicate_count
  end


  def single_tweet(tweet, keyword_id, search_type)

    puts "It is getting to the search function parse with tweet: #{tweet.text}"

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
    unprocessed_tweet_hash[:description] = tweet.user.description

    if search_type == 'country'

      country_id = save_tweet(unprocessed_tweet_hash[:location], keyword_id)

      if country_id != false
        unprocessed_tweet_hash[:country_id] = country_id
      else
        return false
      end
    end


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

  def save_tweet(profile_location, keyword_id)
    if profile_location.blank?
      return false
    end

    lead_stream = LeadStream.find(Keyword.find(keyword_id).lead_stream_id)

    if @country_helper.location_in_country?(profile_location, lead_stream.country_id)
      lead_stream.country_id
    else
      return false
    end

  end

  def tweet_has_lead_stream_country?(country_id, lead_stream)
    if country_id == lead_stream.country_id
      return true
    end
    return false
  end

end