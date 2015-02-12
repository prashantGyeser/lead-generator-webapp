class Dashboard::LeadStreamsController < Dashboard::ApplicationController
  def index

    @lead_streams = LeadStream.where(user_id: current_user.id)

  end

  def new
    @lead_stream = LeadStream.new
    3.times {@lead_stream.keywords.build}
  end

end
