# == Schema Information
#
# Table name: non_leads
#
#  id                       :integer          not null, primary key
#  poster_id                :string(255)
#  poster_name              :string(255)
#  poster_screen_name       :string(255)
#  poster_follower_count    :integer
#  poster_friends_count     :integer
#  poster_verified          :boolean
#  poster_statuses_count    :integer
#  tweet_body               :string(255)
#  keyword_id               :integer
#  poster_profile_image_url :string(255)
#  created_at               :datetime
#  updated_at               :datetime
#  tweet_id                 :integer
#

require 'rails_helper'

RSpec.describe NonLead, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
