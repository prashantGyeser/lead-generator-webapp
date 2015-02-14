class SubscriptionsController < ApplicationController
  layout false
  #layout 'application', :except => :show
  def show
    account_code = params[:account_code]
    plan_code = params[:plan]
    user = User.find_by_email(account_code)
    @subscription = Subscription.create(account_code: account_code, plan_code: plan_code, user_id: user.id)
  end
end
