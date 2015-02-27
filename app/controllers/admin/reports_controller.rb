class Admin::ReportsController < Admin::ApplicationController
  def unprocessed_tweets
    @unprocessed_tweets_by_day_for_fortnight = UnprocessedTweet.by_fortnight.group_by { |c| c.created_at.to_date }
  end
end
