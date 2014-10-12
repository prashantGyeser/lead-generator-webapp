class EerfzfckilwswwiwController < ApplicationController
  def index
    @user_leads = UserLead.where(:lead_stream_id => 37).order('created_at DESC')
  end
end
