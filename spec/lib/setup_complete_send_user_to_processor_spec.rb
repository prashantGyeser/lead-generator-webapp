require 'rails_helper'
require 'setup_complete_send_user_to_processor'
require 'send_user_to_external_system'

RSpec.describe SetupCompleteSendUserToProcessor do

  before(:each) do
    @user = User.create(email: 'rspec@test.com', password: 'password@123', password_confirmation: 'password@123')
    @city = City.create(name: "New York")
    @category = Category.create(name: "mexican")
    @token = Token.create(provider: 'twitter', oauth_token: '323432jhdskljfdsdf', oauth_secret: 'dfjsdlfjsdfsm3234', user_id: @user.id)
    @user_category = UserCategory.create(user_id: @user.id, category_id:@category.id)
  end

  it "should send a message to the processor when a user completes setup" do
    @user_city = UserCity.create(user_id: @user.id, city_id: @city.id)

    results = SetupCompleteSendUserToProcessor.send_user_to_processor(@user.id)

    #expect(results.response.code).to eq "200"
    expect(results).to eq true

  end

end