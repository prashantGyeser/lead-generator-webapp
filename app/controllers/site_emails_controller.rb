class SiteEmailsController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def create

    puts "The email is: #{params[:email]}"

    # If the body contains the survey_name parameter...
    if params["type"] == "subscribe"
      # Create a new Email object based on the received parameters...
      site_email = SiteEmail.new(email: params["data"]["email"])
      site_email.save!
    end

    # The webhook doesn't require a response but let's make sure
    # we don't send anything
    render :nothing => true
  end
end
