# == Schema Information
#
# Table name: reports
#
#  id                   :integer          not null, primary key
#  total_tweets_for_day :integer
#  date_collected       :integer
#  city_id              :integer
#  category_id          :integer
#  created_at           :datetime
#  updated_at           :datetime
#

class Report < ActiveRecord::Base
end
