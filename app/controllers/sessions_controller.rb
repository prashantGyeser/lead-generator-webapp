require 'send_user_to_external_system'
require 'create_token_from_auth_hash'
#require 'auth_hash_parser'


class SessionsController < ApplicationController
  def create

    user_id = session[:user_id]
    session[:user_id] = nil

    token = CreateTokenFromAuthHash.create_token(env["omniauth.auth"], user_id)

    redirect_to  dashboard_root_path, notice: 'Successfully integrated Twitter'

  end
end