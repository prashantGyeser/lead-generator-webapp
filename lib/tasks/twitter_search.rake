require 'twitter_helper'

namespace :search do
  desc "Search every keyword that has not been used to search in the last 24 hours"
  task twitter: :environment do

    keywords = Keyword.all

    twitter_helper = TwitterHelper.new

    keywords.each do |keyword|

      lead_stream = LeadStream.find(keyword.lead_stream_id)
      twitter_helper.search(keyword, lead_stream.latitude, lead_stream.longitude)
    end



  end

end