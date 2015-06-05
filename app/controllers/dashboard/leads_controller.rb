require 'setup_status'

class Dashboard::LeadsController < Dashboard::ApplicationController
  def index
    if params[:stream_id]
      @lead_stream = LeadStream.find(params[:stream_id])
    else
      @lead_stream = LeadStream.where(user_id: current_user.id).first

      Honeybadger.notify(
          :error_class   => "No Lead Stream Params",
          :error_message => "No Lead Stream Params: Current user email: #{current_user.email}",
          :parameters    => params
      )
    end

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

      if !current_user.sample_category_id.nil?
        @sample_leads = SampleLead.where(sample_category_id: current_user.sample_category_id)
      end

    end


    if current_user.new_user.nil?
      @new_user = true
      current_user.new_user = false
      current_user.save
    end

    if current_user.active_beta_feature == 'gender'
      @gender_beta_active = true
    end

    # Todo: Fix this. Added this so that paginate does not affect the csv exports
    csv_leads = Lead.where(keyword_id: keyword_ids).where(not_lead: nil)

    respond_to do |format|
      format.html
      format.csv { send_data Lead.to_csv(csv_leads), :type => 'text/csv; charset=utf-8; header=present', :disposition => "attachment; filename=all-leads-#{Time.now.getutc}.csv", :filename => "all-leads-#{Time.now.getutc}.csv" }
    end

  end

  def send_reply

    @tweet_reply = TweetReply.new(message: params[:message], lead_id: params[:lead_id], user_id: current_user.id)

    respond_to do |format|
      if tweet_reply.save
        format.json { render :json => tweet_reply, status: :created }
      else
        Honeybadger.notify(
            :error_class   => "Tweet Reply Error",
            :error_message => "Tweet Reply Error: Unable to save tweet reply #{tweet_reply.errors.full_messages.to_sentence} and the tweet_reply_status is: #{tweet_reply_status}",
            :parameters    => params
        )

        format.json { render :json => tweet_reply.errors, status: 500 }
      end
    end

  end

  def follow

    lead = Lead.find(params[:lead_id])

    token = Token.where(:user_id => current_user.id).last

    # Client initialization
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
      config.access_token        = token.oauth_token
      config.access_token_secret = token.oauth_secret
    end

    follow_result = client.follow(lead.poster_screen_name)

    puts follow_result.inspect

    follow = Follow.create(twitter_screen_name: lead.poster_screen_name, user_id: current_user.id )

    respond_to do |format|
      if !follow_result.first.screen_name.nil?
        format.json { render :json => follow_result, status: :created }
      else
        format.json { render :json => "Error following #{lead.poster_screen_name}", status: 500 }
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
