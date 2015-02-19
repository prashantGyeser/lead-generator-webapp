class Admin::LeadsController < Admin::ApplicationController

  def index
    @lead_stream = LeadStream.find(params[:lead_stream_id])

    keywords = Keyword.where(lead_stream_id: @lead_stream.id)
    keyword_ids = []
    @not_working_keywords = []
    keywords.each do |keyword|
      keyword_ids << keyword.id

      if keyword.not_working == true && !(keyword.archived == true)
        @not_working_keywords << keyword
      end

    end

    @leads = Lead.where(keyword_id: keyword_ids).where(not_lead: nil).paginate(page: params[:page], per_page: 20).order('created_at DESC')

    @leads_available = true

    if @leads.count == 0
      @leads_available = false
    end

  end


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
