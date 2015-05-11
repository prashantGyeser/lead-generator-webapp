class Admin::KeywordReportsController < Admin::ApplicationController
  def index

    @keyword = Keyword.find(params[:keyword_id])

    @unprocessed_tweet_count = []
    @lead_count = []
    @non_lead_count = []

    i = 0
    while i < 120

      # Unprocessed Tweet Counter
      @unprocessed_tweet_count << UnprocessedTweet.where(keyword_id: @keyword.id).between_times(Time.zone.now - (i+24).hours,Time.zone.now - i.hours).count

      # Efficiency counter
      leads = Lead.where(keyword_id: @keyword.id).between_times(Time.zone.now - (i+24).hours,Time.zone.now - i.hours).count
      non_leads = NonLead.where(keyword_id: @keyword.id).between_times(Time.zone.now - 72.hours,Time.zone.now - 48.hours).count

      @lead_count << leads

      @non_lead_count << non_leads

      i = i + 24
    end

  end
end
