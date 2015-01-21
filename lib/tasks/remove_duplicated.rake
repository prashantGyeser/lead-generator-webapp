require 'remove_duplicates'

namespace :duplicates do
  desc "Removes unprocessed tweets that have already been processed"
  task remove: :environment do
    remove_duplicates = RemoveDuplicates.new
    remove_duplicates.unprocessed_tweets
  end

  desc "Set the tweet id for replies already sent"
  task set_tweet_id: :environment do
    remove_duplicates = RemoveDuplicates.new
    remove_duplicates.set_tweet_id_for_replies
  end

end