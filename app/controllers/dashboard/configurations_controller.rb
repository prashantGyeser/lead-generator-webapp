class Dashboard::ConfigurationsController < Dashboard::ApplicationController
  def twitter_accounts
    @tokens = Token.where(user_id: current_user.id)
  end

  def lead_streams
    @lead_streams = LeadStream.where(user_id: current_user.id)
    lead_streams_available = User.find(current_user.id).total_streams

    if @lead_streams.blank?
      @number_of_available_streams = lead_streams_available
    else
      @number_of_available_streams = lead_streams_available - @lead_streams.count
    end
    @lead_stream = LeadStream.new

  end

end