class LifecyclePreview < ActionMailer::Preview

  def founder_welcome
    LifecycleMailer.founder_welcome('prashant@gyeser.com')
  end

end