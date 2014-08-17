require 'rails_helper'
require 'import_leads'


RSpec.describe ImportLeads do

  it "should get all the leads from the processor" do
    results = ImportLeads.import_from_processor
    expect(results).to include(
                           {
                               "email"=>"prashant@urbanzeak.com",
                               "tweet_poster_screen_name"=>"some_awesome_screename",
                               "tweet_body"=>"this is a test tweet body",
                               "user_location"=>nil,
                               "city_latlon_generate_for"=>nil,
                               "tweet_id"=>nil}
                       )
  end

  it "should contain multiple leads" do
    results = ImportLeads.import_from_processor
    expect(results.count).to eq 2
  end


  it "should not store a duplicate lead" do

  end


end