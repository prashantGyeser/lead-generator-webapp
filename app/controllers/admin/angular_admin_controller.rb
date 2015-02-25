require 'subscription_helper'
include ActionView::Helpers::DateHelper

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




  def all_keywords

    keywords = Keyword.all

    subscription_helper = SubscriptionHelper.new

    keywords_to_return = []

    keywords.each do |keyword|
      keyword_to_return = {}

      lead_stream = LeadStream.find(keyword.lead_stream_id)
      user = User.find(lead_stream.user_id)

      keyword_to_return[:email] = user.email
      keyword_to_return[:city] = lead_stream.city_name

      if (subscription_helper.trial_active?(user) || subscription_helper.is_subscribed?(user)) && (keyword.archived == false)
        keyword_to_return[:is_active] = true
      else
        keyword_to_return[:is_active] = false
      end

      if !keyword.last_run.nil?
        keyword_to_return[:human_last_run] = time_ago_in_words(keyword.last_run.to_date)
      end

      if !keyword.last_searched.nil?
        keyword_to_return[:human_last_searched] = time_ago_in_words(keyword.last_searched)
      end



      keywords_to_return << keyword_to_return.merge(keyword.attributes)

    end

    respond_to do |format|
      format.json { render json: keywords_to_return }
    end


  end


end
