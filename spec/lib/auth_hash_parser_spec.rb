require 'auth_hash_parser'
require 'rails_helper'

RSpec.describe AuthHashParser do

  it "should return a valid hash given a omniauth twitter hash" do
    auth_hash = {}
    auth_hash[:provider] = 'twitter'
    auth_hash[:uid] = '2323123123'
    auth_hash[:credentials] = {token: '32343243dssfdsfsdfdssd', :secret => 'fhsdkfksddfsdnfks328094jsadldjadjsla'}
    auth_hash[:info] = {:screen_name => 'test_screen_name'}

    user = User.create(:email => "test2@test.com", :password => "password@123", :password_confirmation => "password@123" )

    auth_hash_details = AuthHashParser.parse(auth_hash)

    expect(auth_hash_details[:oauth_secret]).to eq 'fhsdkfksddfsdnfks328094jsadldjadjsla'
  end


end