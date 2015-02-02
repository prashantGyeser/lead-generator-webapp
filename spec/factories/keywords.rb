# == Schema Information
#
# Table name: keywords
#
#  id                   :integer          not null, primary key
#  term                 :string(255)
#  lead_stream_id       :integer
#  created_at           :datetime
#  updated_at           :datetime
#  admin_created        :boolean
#  archived             :boolean
#  last_searched        :datetime
#  last_result_count    :integer
#  last_duplicate_count :integer
#  not_working          :boolean
#  last_run             :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :keyword do
    term "MyString"
    lead_stream_id 1
  end
end
