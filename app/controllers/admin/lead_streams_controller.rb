class Admin::LeadStreamsController < Admin::ApplicationController
  def index
    @lead_streams = LeadStream.all
  end
end
