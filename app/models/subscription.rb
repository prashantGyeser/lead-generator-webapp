# == Schema Information
#
# Table name: subscriptions
#
#  id           :integer          not null, primary key
#  account_code :string(255)
#  plan_code    :string(255)
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Subscription < ActiveRecord::Base

end
