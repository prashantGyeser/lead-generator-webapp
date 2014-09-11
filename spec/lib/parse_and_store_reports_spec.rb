require 'rails_helper'
require 'parse_and_store_reports'
require 'faker'

RSpec.describe ParseAndStoreReports do

  before(:each) do
    @city = City.create(name: "New York")
    @category = Category.create(name:"asian")
    @report = {
        "total_tweets_for_day"=> 21,
        "date_collected"=>Date.today,
        "city"=> "New York",
        "category"=>"asian",
    }
  end

  it "given a valid lead, it should store it" do
    results = ParseAndStoreReports.save_report(@report)
    expect(results[:city_id]).to eq @city.id
  end


end