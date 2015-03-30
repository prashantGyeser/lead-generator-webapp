require 'twitter_helper'
require 'subscription_helper'

namespace :search do

  desc "Search every keyword that has not been used to search in the last 24 hours"
  task twitter: :environment do

    keywords = Keyword.where(archived: false).where("last_searched < ? OR (last_searched IS NULL)", (DateTime.now - 24.hours))

    puts "Total number of keywords = #{keywords.count}"

    twitter_helper = TwitterHelper.new

    keywords.each do |keyword|

      keyword.last_run = DateTime.now
      keyword.save

      puts "The keyword is: #{keyword.term}"

      lead_stream = LeadStream.find(keyword.lead_stream_id)

      user = User.find(lead_stream.user_id)

      subscription_helper = SubscriptionHelper.new

      trial_active = subscription_helper.trial_active?(user)
      is_subscribed = subscription_helper.is_subscribed?(user)


      if trial_active || is_subscribed
        twitter_helper.search(keyword, lead_stream.latitude, lead_stream.longitude, lead_stream.user_id)

        keyword.last_searched = DateTime.now
        keyword.save

        # Slowing down the calls to adhere to the Twitter API limitations
        sleep 3.minutes
      end


    end
  end

  desc "Search every keyword has never been used to search"
  task unsearched_keywords: :environment do

    keywords = Keyword.where(archived: false).where(last_searched: nil)

    twitter_helper = TwitterHelper.new

    keywords.each do |keyword|

      keyword.last_run = DateTime.now
      keyword.save

      puts "The keyword is: #{keyword.term}"

      lead_stream = LeadStream.find(keyword.lead_stream_id)

      user_active = false
      user = User.find(lead_stream.user_id)

      days_remaining = ((user.created_at + (user.trial_duration).days).to_date - Date.today).round

      if ((Subscription.where(user_id: user.id).count) > 0) || (days_remaining > 0)
        user_active = true
      end



      if user_active
        twitter_helper.search(keyword, lead_stream.latitude, lead_stream.longitude, lead_stream.user_id)

        keyword.last_searched = DateTime.now
        keyword.save

        # Slowing down the calls to adhere to the Twitter API limitations
        sleep 3.minutes
      end


    end
  end

  desc "Search every keyword has not been searched for in the last 2 days"
  task unsearched_in_48_hours: :environment do

    keywords = Keyword.where(archived: false).where("last_searched < ? OR (last_searched IS NULL)", (DateTime.now - 48.hours))

    puts "Total number of keywords = #{keywords.count}"

    twitter_helper = TwitterHelper.new

    keywords.each do |keyword|

      keyword.last_run = DateTime.now
      keyword.save

      puts "The keyword is: #{keyword.term}"

      lead_stream = LeadStream.find(keyword.lead_stream_id)

      user_active = false
      user = User.find(lead_stream.user_id)

      days_remaining = ((user.created_at + (user.trial_duration).days).to_date - Date.today).round

      if ((Subscription.where(user_id: user.id).count) > 0) || (days_remaining > 0)
        user_active = true
      end


      if user_active
        twitter_helper.search(keyword, lead_stream.latitude, lead_stream.longitude, lead_stream.user_id)

        keyword.last_searched = DateTime.now
        keyword.save

        # Slowing down the calls to adhere to the Twitter API limitations
        sleep 3.minutes
      end


    end

  end



  desc "Manual search"
  task twitter_manually_NY: :environment do

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
      config.access_token        = '2431831016-cQXzpH7eoR7iSBO2A3nb7OLWzNcPBGngAeIxlEz'
      config.access_token_secret = '2iIxN9FmebV6cHLNZxugz16z3m9qogJIKhc6ubkgHfWM7'
    end

    keyword = "sushi"

    client.search( keyword, geocode: "40.7127837,-74.0059413,25mi" ).collect do |tweet|
      puts tweet.id
    end
  end

  # Enter the command line using rake task[argument]
  desc "Search every keyword has not been searched for in the last 2 days"
  task :search_for_user, [:email] => [:environment] do |t, args|

    user = User.find_by_email(args[:email])

    twitter_helper = TwitterHelper.new

    puts "Search for user: #{user.email}"

    if user.nil?
      puts "Check the email entered. Could not find an account with email #{args[:email]}"
    else
      lead_streams = LeadStream.where(user_id: user.id)

      puts "Number of lead stream: #{lead_streams.count}"

      lead_streams.each do |lead_stream|

        puts "Search for keyword: #{keyword.term}"

        keywords = Keyword.where(lead_stream_id: lead_stream.id).where(archived: false)

        twitter_helper.search(keyword, lead_stream.latitude, lead_stream.longitude, lead_stream.user_id)

        keyword.last_searched = DateTime.now
        keyword.save

        # Slowing down the calls to adhere to the Twitter API limitations
        sleep 3.minutes
      end

    end


  end



end