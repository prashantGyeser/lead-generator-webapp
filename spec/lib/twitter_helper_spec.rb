require 'twitter_helper'
require 'rails_helper'

RSpec.describe TwitterHelper do

  it "should return a list of the search results" do
    twitter_helper = TwitterHelper.new

    results = twitter_helper.search("test","hello")



    #expect(results.first.to_h).to eq true

  end


end