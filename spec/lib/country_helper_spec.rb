require 'country_helper'
require 'rails_helper'

RSpec.describe CountryHelper do


  it "should return the country id if the location exists" do
    country = Country.create(name: "United States")
    location = Location.create(country_id: country.id, name: "New York")

    country_helper = CountryHelper.new

    country_details = country_helper.detect_country("New York")
    expect(country_details[:country_id]).to eq country.id

  end

  it "should not return the country id if the location does not exists" do
    country = Country.create(name: "United States")
    location = Location.create(country_id: country.id, name: "New2York")

    country_helper = CountryHelper.new

    country_details = country_helper.detect_country("New York")
    expect(country_details[:country_id]).to eq nil

  end


  it "should return the country id if the location exists and are in different cases" do
    country = Country.create(name: "United States")
    location = Location.create(country_id: country.id, name: "New York")

    country_helper = CountryHelper.new

    country_details = country_helper.detect_country("new york")
    expect(country_details[:country_id]).to eq nil

  end

end