require 'country_helper'

RSpec.describe CountryHelper do


  it "should return true if the location has an american city in it" do
    country_helper = CountryHelper.new
    expect(country_helper.is_location_in_us?("New York")).to eq true
  end

  it "should return false if the location does not have an american city in it" do
    country_helper = CountryHelper.new
    expect(country_helper.is_location_in_us?("Chennai")).to eq false
  end

end