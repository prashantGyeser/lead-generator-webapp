
require 'setup_status'

class Dashboard::ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  skip_filter :redirect_to_http
  before_action :authenticate_user!

  #before_filter :check_subscription
  before_filter :check_setup

  layout "dashboard/application"

  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def check_subscription

  end

  def check_setup

    if current_user.setup_complete == true
      redirect_to dashboard_root_path
    elsif LeadStream.where(user_id: current_user.id).count <= 0
      redirect_to dashboard_initial_setups_index_path
    else
      redirect_to dashboard_initial_setups_connect_twitter_path
    end

  end


end
