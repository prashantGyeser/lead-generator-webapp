# == Schema Information
#
# Table name: unprocessed_tweets
#
#  id                       :integer          not null, primary key
#  poster_id                :string(255)
#  poster_name              :string(255)
#  poster_screen_name       :string(255)
#  poster_follower_count    :integer
#  poster_friends_count     :integer
#  poster_verified          :boolean
#  poster_statuses_count    :integer
#  poster_rpofile_image_url :string(255)
#  tweet_body               :string(255)
#  created_at               :datetime
#  updated_at               :datetime
#  keyword_id               :integer
#

class UnprocessedTweet < ActiveRecord::Base
end
