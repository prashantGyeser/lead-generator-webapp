# == Schema Information
#
# Table name: leads
#
#  id                                 :integer          not null, primary key
#  screen_name                        :string(255)
#  tweet                              :text
#  location                           :string(255)
#  profile_url                        :string(255)
#  created_at                         :datetime
#  updated_at                         :datetime
#  times_shown                        :integer
#  date_last_shown                    :date
#  user_image_url                     :string(255)
#  tweet_id                           :string(255)
#  user_id                            :integer
#  lead_stream_id                     :integer
#  city_id                            :integer
#  category_id                        :integer
#  processor_datasift_subscription_id :integer
#

require 'rails_helper'

RSpec.describe Lead, :type => :model do
  it { should validate_uniqueness_of(:tweet_id).scoped_to(:user_id)}
end
