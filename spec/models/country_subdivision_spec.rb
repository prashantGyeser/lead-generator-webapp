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

  it "should have unique radius, lat and lon against a country id" do
    CountrySubdivision.create(radius: 1000, latitude: 40, longitude: 50, country_id: 1)
    CountrySubdivision.create(radius: 1000, latitude: 40, longitude: 50, country_id: 1)
    expect(CountrySubdivision.count).to eq 1
  end

  it "should create a record with different latitude and long" do
    CountrySubdivision.create(radius: 1000, latitude: 40, longitude: 50, country_id: 1)
    CountrySubdivision.create(radius: 1000, latitude: 42, longitude: 50, country_id: 1)
    expect(CountrySubdivision.count).to eq 2
  end

end
