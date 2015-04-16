require 'socialmedia/client'
require 'socialmedia/search'
require 'socialmedia/search_stats'
require 'socialmedia/parse_search_results'

class SocialmediaSearch


  def twitter_geocode_search(token, keyword, lat_lon_hash, radius)
    client = Client.initialize_twitter(token.oauth_token, token.oauth_secret)

    search = Search.new
    parse_and_store_results = ParseSearchResults.new
    stats = SearchStats.new

    search_results = search.twitter_geocode(keyword.term, lat_lon_hash,radius, client)

    total_results = search_results.count

    duplicate_count = parse_and_store_results.twitter(search_results)

    stats.set_search_stats(total_results, duplicate_count, keyword )
  end

  def


  def active_keywords
    Keyword.active.no_search_in_24_hrs_or_never_searched
  end

end