require 'share_leads'

namespace :share do
  desc "Share the datasift leads with all the users"
  task leads: :environment do
    share_leads = ShareLeads.new
    share_leads.share_datsift_leads
  end
end