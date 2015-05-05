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
#  not_lead                           :boolean
#  archived                           :boolean
#  tweet_id                           :string(255)
#  gender                             :string(255)
#  country                            :string(255)
#  country_id                         :integer
#

class Lead < ActiveRecord::Base
  validates_uniqueness_of :tweet_id, scope: :keyword_id
  belongs_to :keyword

  def self.to_csv(all_user_leads)
    CSV.generate do |csv|
      csv << ['Username', 'Tweet', 'Created On(mm-dd--yyyy)']
      all_user_leads.each do |lead|
        csv << [lead.poster_screen_name, lead.tweet_body, lead.created_at.strftime('%m-%d-%Y')]
      end
    end
  end


end
