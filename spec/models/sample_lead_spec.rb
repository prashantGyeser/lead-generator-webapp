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

require 'rails_helper'

RSpec.describe SampleLead, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
