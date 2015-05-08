require 'socialmedia/parse_search_results'

class Search

  def twitter(term, client, keyword_id, search_type)
    start = 0
    search_results = client.search( term, lang: 'en' )

    parse_search_results = ParseSearchResults.new

    search_result_count = 0

    begin
      iterations = 0
      search_results.each(start).with_index do |tweet, index|

        search_result_count = search_result_count + 1
        iterations = index
        save_results = parse_search_results.single_tweet(tweet, keyword_id, search_type)

        if search_result_count >= 5000
          return search_result_count
        end

      end

    rescue Twitter::Error::TooManyRequests => error
      puts "Hit the rate limit going to sleep for #{error.rate_limit.reset_in}"
      start += iterations
      sleep error.rate_limit.reset_in + 1
      sleep 15.minutes
      retry
    rescue => e
      Honeybadger.notify(
          :error_class   => "Twitter Global Search Error",
          :error_message => "Twitter Global Search Error: #{e.message}",
          :parameters    => {term: term}
      )
    end

    return search_result_count

  end


  def twitter_geocode(term, lat_lon_hash, radius, client)
    puts "it is getting to the geocode search"
    begin
      client.search( term, result_type: "recent", geocode: "#{lat_lon_hash[:latitude]},#{lat_lon_hash[:longitude]},#{radius}km" ).collect
    rescue => e
      Honeybadger.notify(
          :error_class   => "Twitter Search Error",
          :error_message => "Twitter Search Error: #{e.message}",
          :parameters    => {term: term}
      )
    end


  end

end