class Admin::KeywordReportsController < Admin::ApplicationController
  def index

    keyword = Keyword.find(params[:keyword_id])

    @unprocessed_tweet_count = []

    @unprocessed_tweet_count << UnprocessedTweet.where(keyword_id: keyword.id).today.count
    @unprocessed_tweet_count << UnprocessedTweet.where(keyword_id: keyword.id).yesterday.count
    @unprocessed_tweet_count << UnprocessedTweet.where(keyword_id: keyword.id).between_times(Time.zone.now - 72.hours,Time.zone.now - 48.hours).count
    @unprocessed_tweet_count << UnprocessedTweet.where(keyword_id: keyword.id).between_times(Time.zone.now - 96.hours,Time.zone.now - 72.hours).count
    @unprocessed_tweet_count << UnprocessedTweet.where(keyword_id: keyword.id).between_times(Time.zone.now - 120.hours,Time.zone.now - 96.hours).count

  end
end
