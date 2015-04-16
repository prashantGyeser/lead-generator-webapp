require 'socialmedia/client'
require 'socialmedia/search'
require 'socialmedia/search_stats'
require 'socialmedia/parse_search_results'

class SocialmediaSearch


  def twitter_geocode_search(oauth_token, oauth_secret, keyword, lat_lon_hash, radius)
    client = Client.initialize_twitter(oauth_token, oauth_secret)

    search = Search.new
    parse_and_store_results = ParseSearchResults.new
    stats = SearchStats.new

    search_results = search.twitter_geocode(keyword.term, lat_lon_hash,radius, client)

    total_results = search_results.count

    duplicate_count = parse_and_store_results.twitter(search_results)

    stats.set_search_stats(total_results, duplicate_count, keyword )
  end

  def search_active_keywords

    active_keywords.each do |keyword|

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