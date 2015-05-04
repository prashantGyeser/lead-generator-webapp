require 'socialmedia/parse_search_results'

class Search

  def twitter(term, client, keyword_id)
    start = 0
    search_results = client.search( term )

    parse_search_results = ParseSearchResults.new

    puts "It is getting to just past the search"

    search_result_count = 0

    begin
      iterations = 0
      search_results.each(start).with_index do |tweet, index|

        search_result_count = search_result_count + 1

        puts "Search result count: #{search_result_count}"

        iterations = index

        parse_search_results.single_tweet(tweet, keyword_id)
        puts '**********************************************************'

      end

    rescue Twitter::Error::TooManyRequests => error
      puts "Hit the rate limit going to sleep for #{error.rate_limit.reset_in}"
      start += iterations
      sleep error.rate_limit.reset_in + 1
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