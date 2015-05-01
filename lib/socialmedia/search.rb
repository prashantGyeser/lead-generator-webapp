

class Search

  def twitter(term, client)
    start = 0
    search_results = client.search( term )

    puts "It is getting to just past the search"
    search_results.inspect

    begin
      iterations = 0
      search_results.each(start).with_index do |search_result, index|

        puts "It is getting into the iteration"

        iterations = index

        puts search_result.to_h.inspect
        puts '**********************************************************'

      end

    rescue Twitter::Error::TooManyRequests => error
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