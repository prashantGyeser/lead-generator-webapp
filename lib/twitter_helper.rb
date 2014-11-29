class TwitterHelper

  def initialize
  end


  def search(search_term, city)
    client = initialize_twitter_client
    client.search("to:justinbieber marry me", result_type: "recent").collect
  end

  def reply

  end

  private
  def initialize_twitter_client
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
      config.access_token        = '2431831016-cQXzpH7eoR7iSBO2A3nb7OLWzNcPBGngAeIxlEz'
      config.access_token_secret = '2iIxN9FmebV6cHLNZxugz16z3m9qogJIKhc6ubkgHfWM7'
    end
  end


end