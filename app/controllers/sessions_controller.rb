require 'setup_complete_send_user_to_processor'
require 'create_token_from_auth_hash'
#require 'auth_hash_parser'


class SessionsController < ApplicationController
  def create

    user_id = session[:user_id]
    session[:user_id] = nil

    token = CreateTokenFromAuthHash.create_token(env["omniauth.auth"], user_id)
    SetupCompleteSendUserToProcessor.send_user_to_processor(self.user_id)
    redirect_to  dashboard_initial_setups_index_path, notice: 'Successfully integrated Twitter'

  end
end