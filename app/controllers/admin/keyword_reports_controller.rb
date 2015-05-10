class Admin::KeywordReportsController < Admin::ApplicationController
  def index

    keyword = Keyword.find(params[:keyword_id])

    @unprocessed_tweet_count = []
    @keyword_efficiency = []

    @unprocessed_tweet_count << UnprocessedTweet.where(keyword_id: keyword.id).today.count
    @unprocessed_tweet_count << UnprocessedTweet.where(keyword_id: keyword.id).yesterday.count
    @unprocessed_tweet_count << UnprocessedTweet.where(keyword_id: keyword.id).between_times(Time.zone.now - 72.hours,Time.zone.now - 48.hours).count
    @unprocessed_tweet_count << UnprocessedTweet.where(keyword_id: keyword.id).between_times(Time.zone.now - 96.hours,Time.zone.now - 72.hours).count
    @unprocessed_tweet_count << UnprocessedTweet.where(keyword_id: keyword.id).between_times(Time.zone.now - 120.hours,Time.zone.now - 96.hours).count


    # Leads/(Leads + NonLeads) * 100
    leads = Lead..where(keyword_id: keyword.id).today.count
    non_leads = NonLead.where(keyword_id: keyword.id).today.count
    @keyword_efficiency << (leads/(leads + non_leads)) * 100

    leads = Lead..where(keyword_id: keyword.id).yesterday.count
    non_leads = NonLead.where(keyword_id: keyword.id).yesterday.count
    @keyword_efficiency << (leads/(leads + non_leads)) * 100

    leads = Lead..where(keyword_id: keyword.id).yesterday.count
    non_leads = NonLead.where(keyword_id: keyword.id).between_times(Time.zone.now - 72.hours,Time.zone.now - 48.hours).count
    @keyword_efficiency << (leads/(leads + non_leads)) * 100

    leads = Lead..where(keyword_id: keyword.id).yesterday.count
    non_leads = NonLead.where(keyword_id: keyword.id).between_times(Time.zone.now - 96.hours,Time.zone.now - 72.hours).count
    @keyword_efficiency << (leads/(leads + non_leads)) * 100

    leads = Lead..where(keyword_id: keyword.id).yesterday.count
    non_leads = NonLead.where(keyword_id: keyword.id).between_times(Time.zone.now - 120.hours,Time.zone.now - 96.hours).count
    @keyword_efficiency << (leads/(leads + non_leads)) * 100

  end
end
