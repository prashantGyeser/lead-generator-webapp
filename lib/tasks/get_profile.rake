require 'twitter_helper'

namespace :get do

  desc "Search every keyword that has not been used to search in the last 24 hours"
  task profile: :environment do

    twitter_helper = TwitterHelper.new
    twitter_helper.get_profile_info
  end

end