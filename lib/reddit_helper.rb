require 'net/http'
require 'uri'

class RedditHelper

  def get_page
    reddit_api_url = "http://www.reddit.com/.json"
    resp = Net::HTTP.get_response(URI.parse(reddit_api_url))
    data = resp.body
    result = JSON.parse(data)

    return result
  end

end