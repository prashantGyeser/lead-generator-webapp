class TwitterResultsIterator
  attr_reader :search_results, :max_results, :search_result_count, :iterations, :start, :keyword

  def initialize(search_results, args)
    @search_results = search_results
    @max_results = args[:max_search_results] || 5000
    @keyword = args[:keyword]
    @search_type = args[:search_type]
    @search_result_count = 0
    @iterations = 0
    @start = 0
  end

  def iterate
    puts "it is in the iterate"
    begin

      search_results.each(start).with_index do |tweet, index|
        increment_search_counter
        set_iterations(index)
        save_results = parse_search_results.single_tweet(tweet, keyword.id, search_type)

        if stop_search?
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
      puts "Hittin an error: #{e.message}"
      Honeybadger.notify(
          :error_class   => "Twitter Global Search Error",
          :error_message => "Twitter Global Search Error: #{e.message}",
          :parameters    => {term: keyword.term}
      )
    end
  end

  private
  def parse_tweet(tweet)

  end

  def increment_search_counter
    search_result_count = search_result_count + 1
  end

  def set_iterations(index)
    iterations = index
  end

  def stop_search?(result_counter)
    if result_counter >= max_results
      true
    end

    false
  end


end