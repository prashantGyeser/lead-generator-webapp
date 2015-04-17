# == Schema Information
#
# Table name: country_subdivisions
#
#  id         :integer          not null, primary key
#  country_id :integer
#  latitude   :float
#  longitude  :float
#  created_at :datetime
#  updated_at :datetime
#  radius     :integer
#

require 'rails_helper'

RSpec.describe CountrySubdivision, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
