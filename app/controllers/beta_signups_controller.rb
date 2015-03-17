class BetaSignupsController < ApplicationController
  def create

    beta_signup = BetaSignup.new(beta_signup_params)
    if beta_signup.save
      render :json => { }
    else
      render :json => {  }, :status => 500
    end

  end


  private
  def beta_signup_params
    params.require(:beta_signup).permit(:email)
  end

end
