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
#  klout_score                        :integer
#  friends_count                      :integer
#  followers_count                    :integer
#  priority                           :string(255)
#  poster_id                          :string(255)
#  poster_name                        :string(255)
#  poster_screen_name                 :string(255)
#  poster_follower_count              :integer
#  poster_friends_count               :integer
#  poster_verified                    :boolean
#  poster_statuses_count              :integer
#  tweet_body                         :string(255)
#  keyword_id                         :integer
#  poster_profile_image_url           :string(255)
#

require 'rails_helper'

RSpec.describe Lead, :type => :model do
  it { should validate_uniqueness_of(:tweet).scoped_to(:city_id,:category_id)}

  it "should only store a lead when the text is unique for a stream" do
    lead = Lead.create(tweet: "This is a test", tweet_id: "drsdfs3w2342423424", city_id: 1, category_id: 1)
    lead_2 = Lead.create(tweet: "This is a test", tweet_id: "drsdfs3w2342423424", city_id: 1, category_id: 1)

    expect(lead_2.errors.messages[:tweet][0]).to eq "has already been taken"

  end

  it "should only store a lead when the text is unique for a stream" do
    lead = Lead.create(tweet: "This is a test", tweet_id: "drsdfs3w2342423424", city_id: 1, category_id: 1)
    lead_2 = Lead.create(tweet: "This is a test", tweet_id: "drsdfs3w2342423424", city_id: 1, category_id: 2)

    expect(lead_2.id).not_to eq nil

  end





end
