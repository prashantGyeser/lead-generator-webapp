# == Schema Information
#
# Table name: subscription_plans
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  price        :integer
#  lead_streams :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class SubscriptionPlan < ActiveRecord::Base
end
