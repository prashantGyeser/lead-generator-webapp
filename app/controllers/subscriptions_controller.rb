class SubscriptionsController < ApplicationController
  layout false
  #layout 'application', :except => :show
  def show
    account_code = params[:account_code]
    plan_code = params[:plan_code]

    #Subscription.create(account_code: account_code, plan_code: plan_code, user_id: current_user.id)


  end
end
