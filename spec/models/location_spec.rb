# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  country_id :integer
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Location, :type => :model do

  it "should only allow unique names against a country id" do
    Location.create(country_id: 1, name: 'test')
    location = Location.create(country_id: 1, name: 'test')

    expect(location.errors.messages[:name]).to include("has already been taken")

  end

end
