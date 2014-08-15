# == Schema Information
#
# Table name: user_cities
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  city_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe UserCity, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
