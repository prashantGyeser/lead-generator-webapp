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



  def search_active_keywords(admin_search=false, no_delay=false)

    puts "Function called: admin_search: #{admin_search}, no_delay: #{no_delay}"

    subscription_helper = SubscriptionHelper.new

    User.find_each do |user|
      puts "User email: #{user.email}"
      if subscription_helper.is_active?(user)

        puts "Active user: #{user.email}"

        lead_streams = user.lead_streams

        if admin_search == false
          token = Token.where(user_id: user.id).last
        end


        if token || (admin_search == true)
          lead_streams.each do |lead_stream|

            if no_delay == true
              puts "It is in the no dela function"
              keywords = lead_stream.keywords.active
            else
              keywords = lead_stream.keywords.active.no_search_in_24_hrs_or_never_searched
            end
            puts "The toal keywords are: #{keywords.count}"

            if lead_stream.search_type == "country"

              puts "In the country search"

              country = Country.find(lead_stream.country_id)
              country_subdivisions = country.country_subdivisions

              country_subdivisions.each do |country_subdivision|

                latitude_longitude_hash = {latitude: country_subdivision.latitude, longitude: country_subdivision.longitude}

                keywords.each do |keyword|

                  puts "searching for term:#{keyword.term}"

                  if admin_search == true
                    twitter_geocode_search(ENV['TWITTER_ADMIN_ACCESS_TOKEN'], ENV['TWITTER_ADMIN_TOKEN_SECRET'], keyword, latitude_longitude_hash, country_subdivision.radius)
                  else
                    twitter_geocode_search(token.oauth_token, token.oauth_secret, keyword, latitude_longitude_hash, country_subdivision.radius)
                  end


                end
              end

            end

          end
        end


      end
    end

  end


  def admin_single_keyword(keyword_id)
    keyword = Keyword.find(keyword_id)
    lead_stream = LeadStream.find(keyword.lead_stream_id)

    if !lead_stream.country_id.nil?
      country = Country.find(lead_stream.country_id)
      country_subdivisions = country.country_subdivisions
      country_subdivisions.each do |country_subdivision|
        lat_lon_hash = {latitude: country_subdivision.latitide, longitude: country_subdivision.longitude}
        twitter_geocode_search(ENV['TWITTER_ADMIN_ACCESS_TOKEN'], ENV['TWITTER_ADMIN_TOKEN_SECRET'], keyword, lat_lon_hash, country_subdivision.radius)
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