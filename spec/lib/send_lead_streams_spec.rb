require 'rails_helper'
require 'send_lead_streams'

RSpec.describe SendLeadStreams do

  it "should return a list of all unique lead steams" do
    city = City.create(name: "New York")
    category = Category.create(name: "asian")
    lead_stream = FactoryGirl.create(:lead_stream, city_id: city.id, category_id: category.id)

    results = SendLeadStreams.get_unique_streams

    expect(results.first[:city]).to eq city.name
    expect(results.first[:category]).to eq category.name

  end

  it "should return only one lead stream when two exist with the same city and category" do
    city = City.create(name: "New York")
    category = Category.create(name: "asian")
    FactoryGirl.create(:lead_stream, city_id: city.id, category_id: category.id)
    FactoryGirl.create(:lead_stream,user_id: 2, city_id: city.id, category_id: category.id)

    results = SendLeadStreams.get_unique_streams

    expect(results.count).to eq 1
  end


  it "should return two streams when either a city or category is different in the stream" do
    city = City.create(name: "New York")
    city_2 = City.create(name: "LA")
    category = Category.create(name: "asian")
    FactoryGirl.create(:lead_stream, city_id: city.id, category_id: category.id)
    FactoryGirl.create(:lead_stream,user_id: 2, city_id: city_2.id, category_id: category.id)

    results = SendLeadStreams.get_unique_streams

    expect(results.count).to eq 2
  end


  it "should send all the lead streams to the processor" do

    city = City.create(name: "New York")
    city_2 = City.create(name: "London")
    category = Category.create(name: "asian")
    FactoryGirl.create(:lead_stream, city_id: city.id, category_id: category.id)
    FactoryGirl.create(:lead_stream,user_id: 2, city_id: city_2.id, category_id: category.id)

    send_lead_streams = SendLeadStreams.new

    send_lead_streams.send_unique_streams


  end



end