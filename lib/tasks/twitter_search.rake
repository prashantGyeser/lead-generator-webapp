require 'twitter_helper'
require 'subscription_helper'
require 'socialmedia_search'

namespace :search do

  desc "Admin search"
  task admin_search: :environment do
    socialmedia_search = SocialmediaSearch.new
    socialmedia_search.admin_search_active_users
  end


end