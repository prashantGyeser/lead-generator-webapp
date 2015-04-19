require 'socialmedia/client'
require 'socialmedia/search'
require 'socialmedia/search_stats'
require 'socialmedia/parse_search_results'
require 'subscription_helper'

class SocialmediaSearch


  def twitter_geocode_search(oauth_token, oauth_secret, keyword, lat_lon_hash, radius)
    client = Client.initialize_twitter(oauth_token, oauth_secret)

    search = Search.new
    parse_and_store_results = ParseSearchResults.new
    stats = SearchStats.new

    search_results = search.twitter_geocode(keyword.term, lat_lon_hash,radius, client)

    total_results = search_results.count

    puts "Returned #{total_results} search results"

    duplicate_count = parse_and_store_results.twitter(search_results, keyword.id)

    stats.set_search_stats(total_results, duplicate_count, keyword )

    sleep 2.minutes

  end



  def search_active_keywords

    puts "Function called"

    subscription_helper = SubscriptionHelper.new

    User.find_each do |user|
      if subscription_helper.is_active?(user)
        lead_streams = user.lead_streams
        token = Token.where(user_id: user.id).last

        if token
          lead_streams.each do |lead_stream|
            keywords = lead_stream.keywords.active.no_search_in_24_hrs_or_never_searched

            if lead_stream.search_type == "country"

              puts "In the country search"

              country = Country.find(lead_stream.country_id)
              country_subdivisions = country.country_subdivisions

              country_subdivisions.each do |country_subdivision|

                latitude_longitude_hash = {latitude: country_subdivision.latitude, longitude: country_subdivision.longitude}

                keywords.each do |keyword|

                  puts "searching for term:#{keyword.term}"

                  twitter_geocode_search(token.oauth_token, token.oauth_secret, keyword, latitude_longitude_hash, country_subdivision.radius)
                end
              end

            end

          end
        end


      end
    end

  end



  private
  def active_keywords
    Keyword.active.no_search_in_24_hrs_or_never_searched
  end

  def user_token_lead_stream(keyword)
    lead_stream = LeadStream.find(keyword.lead_stream_id)
    user = User.find(lead_stream.user_id)
    token = Token.where(user_id: user.id).last
    return {user: user, token: token, lead_stream: lead_stream}
  end

end