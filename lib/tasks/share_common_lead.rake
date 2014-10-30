require 'share_leads'

namespace :share do
  desc "Share the datasift leads with all the users"
  task leads: :environment do
    share_leads = ShareLeads.new
    share_leads.share_datsift_leads
  end

  desc "Share todays datasift leads with all users"
  task todays_leads: :environment do
    share_leads = ShareLeads.new
    share_leads.share_todays_leads
  end

end