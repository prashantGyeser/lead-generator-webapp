require 'twitter_helper'

namespace :search do
  desc "Search every keyword that has not been used to search in the last 24 hours"
  task twitter: :environment do

    keywords = Keyword.where(archived: nil).where("last_searched < ? OR (last_searched IS NULL)", (DateTime.now - 24.hours))

    twitter_helper = TwitterHelper.new

    keywords.each do |keyword|
      puts "Searching using term: #{keyword.term}"
      lead_stream = LeadStream.find(keyword.lead_stream_id)
      twitter_helper.search(keyword, lead_stream.latitude, lead_stream.longitude, lead_stream.user_id)

      keyword.last_searched = DateTime.now
      keyword.save

      # Slowing down the calls to adhere to the Twitter API limitations
      sleep 3.minutes

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


end