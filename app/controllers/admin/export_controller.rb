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
    @unprocessed_tweets = UnprocessedTweet.where(keyword_id: @keyword_ids).where(processed: nil)

    respond_to do |format|
      format.html
      format.csv { send_data UnprocessedTweet.to_csv(@unprocessed_tweets), :type => 'text/csv; charset=utf-8; header=present', :disposition => "attachment; filename=all-unprocessed-tweets-#{Time.now.getutc}.csv", :filename => "all-unprocessed-tweets-#{Time.now.getutc}.csv" }
    end

  end

  private
  def set_keyword_ids


    user = User.find(params[:user_id])

    puts "The user email is: #{user.email}"

    lead_streams = user.lead_streams

    puts "The user lead stream count is: #{lead_streams.count}"

    @keyword_ids = []

    lead_streams.each do |lead_stream|

      puts "It is in the lead stream loop"

      @keyword_ids << lead_stream.keywords.pluck(:id)

      puts "It is in the lead stream loop end with keyword ids: #{@keyword_ids}"

    end

    @keyword_ids = @keyword_ids.flatten

  end
end
