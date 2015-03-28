class WebsiteEmailController < ApplicationController

  def create

    email_left = EmailLeft.new(email: params[:email])

    respond_to do |format|
      if email_left.save
        format.json { render :json => email_left, status: :created }
      else
        format.json { render :json => email_left.errors, status: 500 }
      end
    end
  end

end
