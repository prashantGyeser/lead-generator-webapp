class TwitterSearch
  attr_reader :client, :search_term, :search_type, :latitude, :longitude, :keyword

  def initialize(user, args)
    token = Token.where(user_id: user.id).last
    @client = TwitterClient.new(token.oauth_token, token.oauth_secret).client
    @search_term = args[:search_term]
    @search_type = args[:search_type]
    @latitude = args[:latitude]
    @longitude = args[:longitude]
    @keyword = args[:keyword]
  end

  def search
    case search_type
      when "global"
        find_all
      when "geocoded"
        puts "It is in the geocoded search"
        find_geocoded
      else
        return nil
    end
  end

  private
  def find_all
    client.search( keyword.term, lang: 'en' )
  end

  def find_geocoded
    client.search( keyword.term, geocode: "#{latitude},#{longitude},15km" )
  end


end