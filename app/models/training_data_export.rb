# == Schema Information
#
# Table name: training_data_exports
#
#  id                 :integer          not null, primary key
#  tweet_id           :string(255)
#  keyword_term       :string(255)
#  category           :string(255)
#  tweet_body         :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  training_data_type :string(255)
#

class TrainingDataExport < ActiveRecord::Base
  validates_uniqueness_of :tweet_id
end
