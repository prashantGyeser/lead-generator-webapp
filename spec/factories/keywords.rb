# == Schema Information
#
# Table name: keywords
#
#  id             :integer          not null, primary key
#  term           :string(255)
#  lead_stream_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#  admin_created  :boolean
#  archived       :boolean
#  last_searched  :time
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :keyword do
    term "MyString"
    lead_stream_id 1
  end
end
