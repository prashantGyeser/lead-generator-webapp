# == Schema Information
#
# Table name: sample_leads
#
#  id                 :integer          not null, primary key
#  sample_category_id :integer
#  tweet              :string(255)
#  screen_name        :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sample_lead do
    sample_category_id 1
    tweet "MyString"
    screen_name "MyString"
  end
end
