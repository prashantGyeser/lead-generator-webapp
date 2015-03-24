class LifecycleMailer < ActionMailer::Base
  #default from: "Prashant <prashant@urbanzeak.com>"

  def founder_welcome(email)
    time_1_day_from_now_utc = (Time.now.utc) + (24*60*60)
    time_to_send_this_mail_at = time_1_day_from_now_utc.strftime("%Y-%m-%d %H:%M:%S")

    mail :to => email, :subject => "A personal hello", from: "Prashant from Urbanzeak <prashant@urbanzeak.com>"

    headers['X-MC-Track'] = "opens"
    headers['X-MC-SendAt'] = "#{time_to_send_this_mail_at}"
    headers['X-MC-Tags'] = "Founder Welcome"
  end

  def integration_incomplete

  end

  def trial_getting_over

  end

  def invitation_not_accepted

  end

  # This is sent as soon as a user accepts an invite
  def welcome_email(email)

  end


end
