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

end