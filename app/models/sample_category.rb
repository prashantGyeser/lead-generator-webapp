# == Schema Information
#
# Table name: sample_categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class SampleCategory < ActiveRecord::Base
  has_many :sample_leads
end
