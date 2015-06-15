require 'socialmedia/twitter_status_updates'
require 'rails_helper'

describe TwitterStatusUpdates, :vcr do

  before(:each) do
    @twitter_credentials = {
        oauth_token: '2431831016-cQXzpH7eoR7iSBO2A3nb7OLWzNcPBGngAeIxlEz',
        oauth_secret: '2iIxN9FmebV6cHLNZxugz16z3m9qogJIKhc6ubkgHfWM7'
    }
  end

  it "should get the user time line" do
    status_updates = TwitterStatusUpdates.new(@twitter_credentials).get_user_statuses('UrbanZeak')
    expect(status_updates.count).to eq 20
    expect(status_updates.first.text).to eq 'Do you know who are awesome? My 4 new followers in the last week! Growing with http://t.co/jAtEHvj1L7'
  end

end
