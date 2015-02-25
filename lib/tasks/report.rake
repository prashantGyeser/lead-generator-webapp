require 'subscription_helper'

namespace :report do
  desc "Set priority based on the words present"
  task active_keywords: :environment do

    subscription_helper = SubscriptionHelper.new
    total_keywords = 0

    User.find_each do |user|

      if subscription_helper.trial_active?(user) || subscription_helper.is_subscribed?(user)

        lead_streams = user.lead_streams

        lead_streams.each do |lead_stream|

          keywords = lead_stream.keywords

          keywords.each do |keyword|
            if keyword.archived == false
              total_keywords = total_keywords + 1
            end
          end

        end

      end

    end

    puts "The total active keywords are: #{total_keywords}"

  end

  desc "Set priority based on the words present"
  task no_search_in_last_day: :environment do

  end

end