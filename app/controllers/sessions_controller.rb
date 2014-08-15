require 'send_message_to_queue'
require 'create_token_from_auth_hash'
#require 'auth_hash_parser'


class SessionsController < ApplicationController
  def create

    user_id = session[:user_id]
    session[:user_id] = nil
    #token = Token.from_omniauth(env["omniauth.auth"], user_id)

    puts "The omniauth is: #{env["omniauth.auth"].inspect}"

#    token_hash = AuthHashParser.parse(env["omniauth.auth"])

    puts "The user_id is: #{user_id}"

    #puts "It is using the following token hash to create a token: #{token_hash}"

    token = CreateTokenFromAuthHash.create_token(env["omniauth.auth"], user_id)

    puts "It is getting past the create with token: #{token.inspect}"

    #SendMessageToQueue.push_message_to_queue(user_id)

    redirect_to  dashboard_root_path, notice: 'Successfully integrated Twitter'

  end
end