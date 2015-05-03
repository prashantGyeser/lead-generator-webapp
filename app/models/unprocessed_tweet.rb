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
#  geo_enabled              :string(255)
#  location                 :string(255)
#  country                  :string(255)
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
    unprocessed_lead_to_store_attr.delete('geo_enabled')


    if is_lead == 'true'
      results = Lead.create(unprocessed_lead_to_store_attr)
    else
      results = NonLead.create(unprocessed_lead_to_store_attr)
    end

  end

  def move_tweet_temp(is_lead)

    unprocessed_lead_to_store_attr = self.attributes
    unprocessed_lead_to_store_attr.delete('id')
    unprocessed_lead_to_store_attr.delete('processed')
    unprocessed_lead_to_store_attr.delete('created_at')
    unprocessed_lead_to_store_attr.delete('updated_at')
    unprocessed_lead_to_store_attr.delete('geo_enabled')


    if is_lead == true
      results = TempLead.create(unprocessed_lead_to_store_attr)
    else
      results = TempNonLead.create(unprocessed_lead_to_store_attr)
    end

  end


  def self.to_csv(all_user_unprocessed_tweets)
    CSV.generate do |csv|
      csv << ['id', 'tweet_id', 'keyword_term', 'category', 'tweet_body', 'created_at', 'updated_at', 'training_data_type']
      all_user_unprocessed_tweets.each do |unprocessed_tweet|
        csv << [unprocessed_tweet.id, unprocessed_tweet.tweet_id, '', 'Shop', unprocessed_tweet.tweet_body, unprocessed_tweet.created_at, unprocessed_tweet.updated_at, '']
      end
    end
  end

end
