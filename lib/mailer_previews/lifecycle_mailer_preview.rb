class LifecyclePreview < ActionMailer::Preview

  def founder_welcome
    LifecycleMailer.founder_welcome('prashant@gyeser.com')
  end

  def welcome_email
    LifecycleMailer.welcome_email('prashant@gyeser.com', 7)
  end

end