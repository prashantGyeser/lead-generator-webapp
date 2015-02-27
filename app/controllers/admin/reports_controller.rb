class Admin::ReportsController < Admin::ApplicationController
  def unprocessed_tweets
    @unprocessed_tweets = UnprocessedTweet.past_year.by_month
  end
end
