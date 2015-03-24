require 'subscription_helper'

namespace :trial do

  desc "Search every keyword that has not been used to search in the last 24 hours"
  task over_notification: :environment do

    subscription_helper = SubscriptionHelper.new

    users = User.where.not(trial_over_notification_sent: true)

    users.each do |user|
      if !subscription_helper.trial_active?(user)
        if !subscription_helper.is_subscribed?(user)

          user.trial_over_notification_sent = true
          if user.save
            LifecycleMailer.trial_ending(user.email).deliver
          else
            # TODO: Handle the errors that occur
          end

        end
      end
    end


  end

end