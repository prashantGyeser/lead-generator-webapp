require 'setup_status'

class Dashboard::LeadsController < Dashboard::ApplicationController
  def index
    if current_user.setup_complete != true
      redirect_to dashboard_initial_setups_index_path
    else


      if LeadStream.exists?(:id => params[:stream_id])
        @lead_stream = LeadStream.find(params[:stream_id])

        if @lead_stream.user_id == current_user.id
          @leads = Lead.where(:lead_stream_id => params[:stream_id]).order('created_at DESC')
          @tweet_reply = TweetReply.new
        else
          flash[:notice] = "Oops! The stream you are looking for does not exist"
          @invalid_stream = true
        end
      else
        flash[:notice] = "Oops! The stream you are looking for does not exist"
        @invalid_stream = true
      end

    end
  end

  def send_reply
    #@tweet_reply = TweetReply.new(tweet_reply_params)

    token = Token.where(:user_id => current_user.id).last

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
      message_to_send = "@#{lead.screen_name}" + params[:tweet_reply][:message]
      TweetReply.create(:message => message_to_send, :lead_id => lead.id, :user_id => current_user.id)
    end

    flash[:success] = "Message successfully sent"
    redirect_to dashboard_leads_index_path


  end


  private
  def tweet_reply_params
    params.require(:tweet_reply).permit(:message, :lead_id, :user_id)
  end

end
