class LeadMailer < ActionMailer::Base
  default from: "notifications@urbanzeak.com"

  def new_leads_email(leads, user)
    @user = user
    @leads = leads
    mail(to: @user.email, subject: "#{@leads.count} new leads today!")
  end

end
