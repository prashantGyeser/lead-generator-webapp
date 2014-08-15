require 'auth_hash_parser'
include Devise::TestHelpers

RSpec.describe AuthHashParser do

  it "should return a valid hash given a omniauth twitter hash" do
    auth_hash = {}
    auth_hash[:provider] = 'twitter'
    auth_hash[:uid] = '2323123123'
    auth_hash =  {:credentials => {:token => '32343243dssfdsfsdfdssd'}}
    auth_hash =  {:credentials => {:secret => 'fhsdkfksddfsdnfks328094jsadldjadjsla'}}

    user = User.create(:email => "test@test.com", :password => "password@123", :password_confirmation => "password@123" )

    auth_hash_details = AuthHashParser.parse(auth_hash)

    expect(auth_hash_details[:oauth_secret]).to eq 'fhsdkfksddfsdnfks328094jsadldjadjsla'
  end


end