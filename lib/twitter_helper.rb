require 'subscription_helper'

class TwitterHelper

  def search(keyword, city_latitude, city_longitude, user_id, global, admin_search)

    if admin_search
      client = initialize_with_admin_token
    else
      client = initialize_twitter_client(user_id)
    end


    puts "Client initialized"

    user = User.find(user_id)

    if !client.nil?

      puts "Client not nil"

      begin

        if global == true
          search_results = client.search( keyword.term ).collect
        else
          puts "Non global search"

          search_results = client.search( keyword.term, geocode: "#{city_latitude},#{city_longitude},25mi" ).collect
        end

        puts "Out of the search if loop"

        puts "search results are: #{search_results.inspect}"

        duplicate_count = parse_and_store_tweets(search_results, keyword.id)

        # Storing search result metrics
        keyword.last_result_count = search_results.count
        keyword.last_duplicate_count = duplicate_count

        keyword.save

      rescue => e
        Honeybadger.notify(
            :error_class   => "Twitter Search Error",
            :error_message => "Twitter Search Error: #{e.message}",
            :parameters    => {user_email: user.email}
        )
      end


    end



  end

  def reply

  end

  def all_active_keyword_no_delay(admin_search)
    Keyword.active.find_each do |keyword|
      puts keyword.term

      keyword.set_last_run

      user_and_stream = user_and_lead_stream(keyword)
      subscription_helper = SubscriptionHelper.new

      if subscription_helper.is_active?(user_and_stream[:user])

        if user_and_stream[:user][:global]
          search(keyword, user_and_stream[:lead_stream][:latitude], user_and_stream[:lead_stream][:longitude], user_and_stream[:lead_stream][:user_id], true, admin_search)
        else
          search(keyword, user_and_stream[:lead_stream][:latitude], user_and_stream[:lead_stream][:longitude], user_and_stream[:lead_stream][:user_id], false, admin_search)
        end

        keyword.set_last_searched

        # Slowing down the calls to adhere to the Twitter API limitations
        sleep 3.minutes

      end
    end
  end

  def active_keyword_search(admin_search)
    active_keywords.each do |keyword|

      puts keyword.term

      keyword.set_last_run

      user_and_stream = user_and_lead_stream(keyword)
      subscription_helper = SubscriptionHelper.new


      if subscription_helper.is_active?(user_and_stream[:user])


        if user_and_stream[:user][:global]
          search(keyword, user_and_stream[:lead_stream][:latitude], user_and_stream[:lead_stream][:longitude], user_and_stream[:lead_stream][:user_id], true, admin_search)
        else
          search(keyword, user_and_stream[:lead_stream][:latitude], user_and_stream[:lead_stream][:longitude], user_and_stream[:lead_stream][:user_id], false, admin_search)
        end

        keyword.set_last_searched

        # Slowing down the calls to adhere to the Twitter API limitations
        sleep 3.minutes

      end



    end
  end

  def single_keyword_search(keyword_id, admin_search)

    keyword = Keyword.find(keyword_id)

    puts keyword.term

    keyword.set_last_run

    user_and_stream = user_and_lead_stream(keyword)
    subscription_helper = SubscriptionHelper.new

    if user_and_stream[:user][:global]
      search(keyword, user_and_stream[:lead_stream][:latitude], user_and_stream[:lead_stream][:longitude], user_and_stream[:lead_stream][:user_id], true, admin_search)
    else
      search(keyword, user_and_stream[:lead_stream][:latitude], user_and_stream[:lead_stream][:longitude], user_and_stream[:lead_stream][:user_id], false, admin_search)
    end

      keyword.set_last_searched

      # Slowing down the calls to adhere to the Twitter API limitations
      sleep 3.minutes

  end

  def active_keywords
    Keyword.active.no_search_in_24_hrs_or_never_searched
  end

  def get_profile_info

    tokens = Token.where(name: nil)

    tokens.each do |token|
      client = initialize_twitter_with_token(token)
      user_info = client.user
      if !user_info.nil?
        token[:profile_image_url] = user_info.profile_image_uri(size = :normal).to_s
        token[:name] = user_info.name

        token.save
      end

      sleep 3.minutes

    end

  end


  private

  def user_and_lead_stream(keyword)
    lead_stream = LeadStream.find(keyword.lead_stream_id)
    user = User.find(lead_stream.user_id)
    return {user: user, lead_stream: lead_stream}
  end

  def initialize_twitter_client(user_id)

    user = User.find(user_id)
    token = Token.where(user_id: user_id).last

    if !token.nil?
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


  end

  def initialize_twitter_with_token(token)
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
          :error_message => "Twitter Initialization Error: #{e.message}"
      )
    end
  end

  def initialize_with_admin_token
    begin
      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['TWITTER_KEY']
        config.consumer_secret     = ENV['TWITTER_SECRET']
        config.access_token        = ENV['TWITTER_ADMIN_ACCESS_TOKEN']
        config.access_token_secret = ENV['TWITTER_ADMIN_TOKEN_SECRET']
      end
    rescue => e
      Honeybadger.notify(
          :error_class   => "Twitter Initialization Error",
          :error_message => "Twitter Initialization Error: #{e.message}"
      )
    end
  end

  def parse_and_store_tweets(search_results, keyword_id)

    duplicate_count = 0

    puts "In the parse function"

    if search_results.count == 0
      Honeybadger.notify(
          :error_class   => "No Tweets",
          :error_message => "No Tweets: #{search_results.inspect}",
          :parameters    => {keyword_id: keyword_id }
      )
    else
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


    return duplicate_count

  end


end