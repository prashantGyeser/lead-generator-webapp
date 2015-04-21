class Admin::ExportController < Admin::ApplicationController

  before_action :set_keyword_ids

  def leads
    @leads = Lead.where(keyword_id: @keyword_ids)

    respond_to do |format|
      format.html
      format.csv { send_data Lead.to_csv(@leads), :type => 'text/csv; charset=utf-8; header=present', :disposition => "attachment; filename=all-leads-#{Time.now.getutc}.csv", :filename => "all-leads-#{Time.now.getutc}.csv" }
    end

  end

  def non_leads
    @non_leads = NonLead.where(keyword_id: @keyword_ids)

    respond_to do |format|
      format.html
      format.csv { send_data NonLead.to_csv(@non_leads), :type => 'text/csv; charset=utf-8; header=present', :disposition => "attachment; filename=all-non-leads-#{Time.now.getutc}.csv", :filename => "all-non-leads-#{Time.now.getutc}.csv" }
    end

  end

  def unprocessed_tweets
    @unprocessed_tweets = UnprocessedTweet.where(keyword_id: @keyword_ids)

    respond_to do |format|
      format.html
      format.csv { send_data UnprocessedTweet.to_csv(@unprocessed_tweets), :type => 'text/csv; charset=utf-8; header=present', :disposition => "attachment; filename=all-unprocessed-tweets-#{Time.now.getutc}.csv", :filename => "all-unprocessed-tweets-#{Time.now.getutc}.csv" }
    end

  end

  private
  def set_keyword_ids

    user = User.find(params[:user_id])
    lead_streams = user.lead_streams

    @keyword_ids = []

    lead_streams.each do |lead_stream|
      @keyword_ids + lead_stream.keywords.pluck(:id)
    end

  end
end
