class LeadPreview < ActionMailer::Preview
  # Pull data from existing fixtures
  def new_leads
    leads = Lead.first(10)
    user = User.find_by_email("prashant@urbanzeak.com")

    LeadMailer.new_leads_email(leads, user)

  end

end