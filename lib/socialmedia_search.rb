require 'socialmedia/client'
require 'socialmedia/search'
require 'subscription_helper'

class SocialmediaSearch

  def admin_search_active_users

    subscription_helper = SubscriptionHelper.new
    client = Client.initialize_twitter(ENV['TWITTER_ADMIN_ACCESS_TOKEN'], ENV['TWITTER_ADMIN_TOKEN_SECRET'])
    search = Search.new

    User.find_each do |user|
      if subscription_helper.is_active?(user)
        lead_streams = user.lead_streams

          lead_streams.each do |lead_stream|
            if !lead_stream.search_type.nil?
              keywords = lead_stream.keywords.active.no_search_in_24_hrs_or_never_searched

              keywords.each do |keyword|

                puts "The keyword being searched is: #{keyword.term}"

                keyword.set_last_run
                search.twitter(keyword.term, client, keyword.id, lead_stream.search_type)
                keyword.set_last_searched
              end
            end
          end


      end
    end

  end




end