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
#  tweet_body               :string(255)
#  created_at               :datetime
#  updated_at               :datetime
#  keyword_id               :integer
#  poster_profile_image_url :string(255)
#  processed                :boolean
#  tweet_id                 :string(255)
#

class UnprocessedTweet < ActiveRecord::Base

  validates_uniqueness_of :tweet_id, scope: :keyword_id

  belongs_to :keyword

  def move_tweet(is_lead)

    unprocessed_lead_to_store_attr = self.attributes
    unprocessed_lead_to_store_attr.delete('id')
    unprocessed_lead_to_store_attr.delete('processed')
    unprocessed_lead_to_store_attr.delete('created_at')
    unprocessed_lead_to_store_attr.delete('updated_at')


    if is_lead == 'true'
      results = Lead.create(unprocessed_lead_to_store_attr)
    else
      results = NonLead.create(unprocessed_lead_to_store_attr)
    end

  end

end
