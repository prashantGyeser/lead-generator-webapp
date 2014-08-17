require 'setup_status'

class Dashboard::LeadsController < Dashboard::ApplicationController
  def index
    if SetupStatus.setup_complete?(current_user.id) == false
      redirect_to dashboard_initial_setups_index_path
    else
      @leads = Lead.where(:user_id => current_user.id).order('created_at DESC')
      @tweet_reply = TweetReply.new
    end
  end

  def send_reply
    @tweet_reply = TweetReply.new(tweet_reply_params)

    if @tweet_reply.save
      flash[:success] = "Message successfully sent"
      redirect_to dashboard_leads_index_path
    else
      flash[:error] = @tweet_reply.errors.empty? ? "Error" : @tweet_reply.errors.full_messages.to_sentence
      redirect_to dashboard_leads_index_path
    end

  end


  private
  def tweet_reply_params
    params.require(:tweet_reply).permit(:message, :lead_id, :user_id)
  end

end
