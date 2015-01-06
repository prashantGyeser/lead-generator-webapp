class Admin::LeadsController < Admin::ApplicationController

  def qc
    @user = User.find(params[:user_id])
    @lead_stream = LeadStream.where(user_id: @user.id).last
    @keywords = Keyword.where(lead_stream_id: @lead_stream.id)
    keyword_ids = []
    @keywords.each do |keyword|
      keyword_ids << keyword.id
    end

    @unprocessed_tweets = UnprocessedTweet.where(keyword_id: keyword_ids).where(processed: nil)
  end

end
