class TwitterClient
  attr_reader :client, :oauth_token, :oauth_secret

  def initialize(oauth_token, oauth_secret)
    @oauth_token = oauth_token
    @oauth_secret = oauth_secret
  end

  def client
    begin
      Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['TWITTER_KEY']
        config.consumer_secret     = ENV['TWITTER_SECRET']
        config.access_token        = oauth_token
        config.access_token_secret = oauth_secret
      end
    rescue => e
      Honeybadger.notify(
          :error_class   => "Twitter Initialization Error",
          :error_message => "Twitter Initialization Error: #{e.message}"
      )
      return nil
    end
  end

end