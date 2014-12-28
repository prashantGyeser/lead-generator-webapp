namespace :notifications do
  desc "Sends an email for the new leads in a day"
  task new_leads: :environment do
    leads = Lead.first(10)
    user = User.find_by_email("prashant@urbanzeak.com")
    puts "Before delivering an email"
    LeadMailer.new_leads_email(leads, user).deliver
  end
end