# == Schema Information
#
# Table name: tweet_replies
#
#  id         :integer          not null, primary key
#  lead_id    :integer
#  message    :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  token_id   :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tweet_reply do
    lead_id 1
    message "MyString"
    user_id 1
  end
end
