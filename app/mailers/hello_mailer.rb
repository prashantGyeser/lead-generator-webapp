class HelloMailer < ActionMailer::Base
  default from: "akhilesh@urbanzeak.com"

  def on_email_left(email)

    time_30_mins_from_now_utc = (Time.now.utc) + (32*60)
    time_to_send_this_mail_at = time_30_mins_from_now_utc.strftime("%Y-%m-%d %H:%M:%S")

    mail :to => email, :subject => "Just wanted to say thank you!"

    headers['X-MC-Track'] = "opens"
    headers['X-MC-SendAt'] = "#{time_to_send_this_mail_at}"

  end


end
