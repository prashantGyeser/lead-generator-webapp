# == Schema Information
#
# Table name: links
#
#  id             :integer          not null, primary key
#  in_url         :string(255)
#  out_url        :text
#  http_status    :integer          default(301)
#  created_at     :datetime
#  updated_at     :datetime
#  tweet_reply_id :integer
#  views          :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link do
    in_url "MyString"
    out_url "MyText"
    http_status 1
  end
end
