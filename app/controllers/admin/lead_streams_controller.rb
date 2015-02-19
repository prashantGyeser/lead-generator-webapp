class Admin::LeadStreamsController < Admin::ApplicationController
  def index
    @user = User.find(params[:user_id])

    @lead_streams = LeadStream.where(user_id: @user.id)
  end
end
