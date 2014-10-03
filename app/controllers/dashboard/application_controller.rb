require 'subscription_utils'

class Dashboard::ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  skip_filter :redirect_to_http
  before_action :authenticate_user!

  before_filter :check_subscription

  layout "dashboard/application"

  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def check_subscription
    user = current_user

    subscription_utils = SubscriptionUtils.new

    if subscription_utils.trial_over?(current_user.id) && !subscription_utils.check_if_subscribed?(current_user.id)
      flash[:message] = "Your trial is over. Please select a plan and subscribe"
      render 'dashboard/account/index'
    end

  end


end
