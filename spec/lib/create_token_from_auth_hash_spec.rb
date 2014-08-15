require 'create_token_from_auth_hash'
require 'auth_hash_parser'
include Devise::TestHelpers

RSpec.describe CreateTokenFromAuthHash do

  it "should create a token given a valid hash" do
    auth_hash = {}
    auth_hash[:provider] = 'twitter'
    auth_hash[:uid] = '2323123123'
    auth_hash =  {:credentials => {:token => '32343243dssfdsfsdfdssd'}}
    auth_hash =  {:credentials => {:secret => 'fhsdkfksddfsdnfks328094jsadldjadjsla'}}

    user = User.create(:email => "test@test.com", :password => "password@123", :password_confirmation => "password@123" )

    #token_hash = AuthHashParser.parse(auth_hash)

    token = CreateTokenFromAuthHash.create_token(auth_hash, user.id)

    #expect(token.oauth_secret).to eq 'fhsdkfksddfsdnfks328094jsadldjadjsla'
    expect(token.user_id).to eq user.id

  end

end