
require 'setup_status'

class Dashboard::ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  skip_filter :redirect_to_http
  before_action :authenticate_user!

  #before_filter :check_subscription
  before_filter :trial_expired?
  before_filter :check_setup
  helper_method :remaining_days
  helper_method :current_user_name

  layout "dashboard/application"

  # find the remaining trial days for this user
  def remaining_days
    ((current_user.created_at + 7.days).to_date - Date.today).round
  end

  def current_user_name
    token = Token.where(user_id: current_user.id).last
    return token.name
  end

  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end


  def check_setup

    if LeadStream.where(user_id: current_user.id).count <= 0
      redirect_to dashboard_initial_setups_index_path
    elsif Token.where(user_id: current_user.id).count <= 0
      redirect_to dashboard_initial_setups_connect_twitter_path
    end

  end


  def trial_expired?
    # find current_user who is login. If you are using devise simply current_user will works
    # now that you have remaining_days, check whether trial period is already completed
    if remaining_days <= 0
      redirect_to dashboard_account_plan_path
    end
  end


end
