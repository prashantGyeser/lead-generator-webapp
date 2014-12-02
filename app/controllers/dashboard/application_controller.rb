
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
    if SetupStatus.setup_complete?(current_user.id)
      #redirect_to dashboard_root_path
    elsif SetupStatus.lead_stream_created?(current_user.id)
      redirect_to dashboard_initial_setups_connect_twitter_path
    end
  end


end
