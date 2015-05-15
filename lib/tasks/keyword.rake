namespace :keyword do

  desc "Set last searched to now for keywords that have more than 500 unprocessed tweets still"
  task set_last_searched_when_more_than_500: :environment do
    Keyword.find_each do |keyword|
      puts "Keyword being checked: #{keyword.term}"

      unprocessed_tweet_count = UnprocessedTweet.where(keyword_id: keyword.id).where(processed: nil).count

      if unprocessed_tweet_count > 500
        keyword.set_last_searched
      end

    end
  end

end