class Dashboard::TodaysLeadsController < Dashboard::ApplicationController
  def index
    @user_leads = UserLead.where("created_at >= ?", Time.zone.now.beginning_of_day)
    @tweet_reply = TweetReply.new
  end


  def send_reply
    #@tweet_reply = TweetReply.new(tweet_reply_params)

    #token = Token.where(:user_id => current_user.id).last

    token = Token.find(params[:tweet_reply][:token_id])

    # Client initialization
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
      config.access_token        = token.oauth_token
      config.access_token_secret = token.oauth_secret
    end

    leads_to_message = params[:tweet_reply][:lead_id].split(',')

    leads_to_message.each do |lead_to_message|
      lead = Lead.find(lead_to_message.to_i)
      message_to_send = "@#{lead.screen_name} " + params[:tweet_reply][:message]
      client.update(message_to_send)
      TweetReply.create(:message => message_to_send, :lead_id => lead.id, :user_id => current_user.id, token_id: params[:tweet_reply][:token_id] )
    end

    flash[:success] = "Message successfully sent"
    redirect_to params[:tweet_reply][:current_path]

  end

end
