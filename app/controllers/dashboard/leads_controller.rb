require 'setup_status'

class Dashboard::LeadsController < Dashboard::ApplicationController
  def index
    if params[:stream_id]
      @lead_stream = LeadStream.find(params[:stream_id])
    else
      @lead_stream = LeadStream.where(user_id: current_user.id).first
    end

    keywords = Keyword.where(lead_stream_id: @lead_stream.id)
    keyword_ids = []
    keywords.each do |keyword|
      keyword_ids << keyword.id
    end

    @leads = Lead.where(keyword_id: keyword_ids).where(not_lead: nil).paginate(page: params[:page], per_page: 30).order('created_at DESC')

    @leads_available = true

    if @leads.count == 0
      @leads_available = false

      if !current_user.sample_category_id.nil?
        @sample_leads = SampleLead.where(sample_category_id: current_user.sample_category_id)
      end

    end


    if current_user.new_user.nil?
      @new_user = true
      current_user.new_user = false
      current_user.save
    end

  end

  def send_reply
    #@tweet_reply = TweetReply.new(tweet_reply_params)

    token = Token.where(:user_id => current_user.id).last

    #token = Token.find(params[:tweet_reply][:token_id])

    # Client initialization
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
      config.access_token        = token.oauth_token
      config.access_token_secret = token.oauth_secret
    end

    lead = Lead.find(params[:lead_id])
    message = params[:message]

    message_to_send = "@#{lead.screen_name} " + message
    client.update(message_to_send)

    tweet_reply = TweetReply.new(:message => message_to_send, :lead_id => lead.id, :user_id => current_user.id, token_id: token.id )

    respond_to do |format|
      if tweet_reply.save
        format.json { render :json => tweet_reply, status: :created }
      else
        format.json { render :json => tweet_reply.errors, status: 500 }
      end
    end

  end

  def mark_non_lead

    lead = Lead.find(params[:lead_id])
    lead.not_lead = true

    respond_to do |format|
      if lead.save
        format.json { render :json => lead, status: :created }
      else
        format.json { render :json => lead.errors, status: 500 }
      end
    end
  end


  private
  def tweet_reply_params
    params.require(:tweet_reply).permit(:message, :lead_id, :user_id)
  end

end
