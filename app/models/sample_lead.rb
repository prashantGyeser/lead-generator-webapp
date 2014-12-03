# == Schema Information
#
# Table name: sample_leads
#
#  id                 :integer          not null, primary key
#  sample_category_id :integer
#  tweet              :string(255)
#  screen_name        :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

class SampleLead < ActiveRecord::Base
  belongs_to :sample_category
end
