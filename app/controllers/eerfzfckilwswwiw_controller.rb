class EerfzfckilwswwiwController < ApplicationController
  def index
    user_leads = UserLead.where(:lead_stream_id => 37).order('created_at DESC')
    @leads = []

    user_leads.each do |user_lead|
      @leads << Lead.find(user_lead.lead_id)
    end

    @leads = @leads.uniq {|l| l.screen_name}

  end
end
