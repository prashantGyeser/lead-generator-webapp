class SessionsController < ApplicationController
  def create

    user_id = session[:user_id]
    session[:user_id] = nil
    token = Token.from_omniauth(env["omniauth.auth"], user_id)

    redirect_to  dashboard_root_path, notice: 'Successfully integrated Twitter'

  end
end