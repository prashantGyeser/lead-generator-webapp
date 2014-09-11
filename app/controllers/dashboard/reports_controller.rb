class Dashboard::ReportsController < Dashboard::ApplicationController
  def index
    if SetupStatus.setup_complete?(current_user.id) == false
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
end
