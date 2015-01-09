require 'remove_duplicates'

namespace :duplicates do
  desc "Removes unprocessed tweets that have already been processed"
  task remove: :environment do
    remove_duplicates = RemoveDuplicates.new
    remove_duplicates.unprocessed_tweets
  end
end