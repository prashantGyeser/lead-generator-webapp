# == Schema Information
#
# Table name: reports
#
#  id                   :integer          not null, primary key
#  total_tweets_for_day :integer
#  city_id              :integer
#  category_id          :integer
#  created_at           :datetime
#  updated_at           :datetime
#  date_collected       :date
#

class Report < ActiveRecord::Base
end
