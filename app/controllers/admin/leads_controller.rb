class Admin::LeadsController < Admin::ApplicationController

  def qc
    @keyword = Keyword.find(params[:keyword_id])
    @lead_stream = LeadStream.find(@keyword.lead_stream_id)

    @unprocessed_tweets = UnprocessedTweet.where(keyword_id: @keyword.id).where(processed: nil)
  end

  def qc_stream
    @lead_stream = LeadStream.find(params[:lead_stream_id])

    @keywords = Keyword.where(lead_stream_id: @lead_stream.id)
    keyword_ids = []
    @keywords.each do |keyword|
      keyword_ids << keyword.id
    end

    @unprocessed_tweets = UnprocessedTweet.where(keyword_id: keyword_ids).where(processed: nil)

  end

end
