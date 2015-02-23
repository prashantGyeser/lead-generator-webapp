require 'subscription_helper'

class Admin::AngularAdminController < Admin::ApplicationController
  def users
  end

  def keywords
  end

  def all_users

    subsciption_helper = SubscriptionHelper.new

    users = User.all

    users_to_return = []

    users.each do |user|

      user_to_return = {}

      days_remaining = subsciption_helper.remaining_days(user)
      is_subscribed = subsciption_helper.is_subscribed?(user)

      if days_remaining > 0 && !is_subscribed
        user_to_return[:trial_remaining] = days_remaining
        user_to_return[:active] = true
        user_to_return[:on_trial] = true
      elsif is_subscribed
        user_to_return[:subscribed] = true
        user_to_return[:active] = true
      else
        user_to_return[:in_active] = true
      end

      users_to_return << user_to_return.merge(user.attributes)

    end


    respond_to do |format|
      format.json { render json: users_to_return }
    end


  end

end
