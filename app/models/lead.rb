# == Schema Information
#
# Table name: leads
#
#  id              :integer          not null, primary key
#  screen_name     :string(255)
#  tweet           :text
#  location        :string(255)
#  profile_url     :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  times_shown     :integer
#  date_last_shown :date
#  user_image_url  :string(255)
#  tweet_id        :string(255)
#  user_id         :integer
#

class Lead < ActiveRecord::Base

  belongs_to :user

  validates_uniqueness_of :tweet_id, :scope => [:user_id]
  validates :user_id, presence: true
  validates :tweet, presence: true
  validates :tweet_id, presence: true
end
