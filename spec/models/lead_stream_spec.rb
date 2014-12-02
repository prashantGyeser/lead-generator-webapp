# == Schema Information
#
# Table name: lead_streams
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  category_id :integer
#  city_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  city_name   :string(255)
#  latitude    :float
#  longitude   :float
#

require 'rails_helper'

RSpec.describe LeadStream, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
