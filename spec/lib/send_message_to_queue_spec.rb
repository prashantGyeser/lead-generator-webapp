# To migrate the test db run rake db:migrate RAILS_ENV=test

require 'send_message_to_queue'
include Devise::TestHelpers


RSpec.describe SendMessageToQueue do

  it "should convert a single category into a string" do
    category = Category.create(name: "bar")
    user = User.create(:email => "test@test.com", :password => "password@123", :password_confirmation => "password@123" )
    UserCategory.create(user_id: user.id, category_id: category.id)
    expect(SendMessageToQueue.get_and_convert_categories_to_string(user.id)).to eq "bar"
  end

  it "should convert a single user city into a string" do
    city = City.create(:name => "NYC")
    user = User.create(:email => "test@test.com", :password => "password@123", :password_confirmation => "password@123" )
    UserCity.create(user_id: user.id, city_id: city.id)
    expect(SendMessageToQueue.get_and_convert_cities_to_string(user.id)).to eq "NYC"
  end

  it "should return a valid message to post to the queue" do
    category = Category.create(name: "bar")
    city = City.create(:name => "NYC")
    user = User.create(:email => "test@test.com", :password => "password@123", :password_confirmation => "password@123" )
    UserCategory.create(user_id: user.id, category_id: category.id)
    UserCity.create(user_id: user.id, city_id: city.id)
    token = Token.create(user_id: user.id, oauth_token: 'rhdskdfhdks', oauth_secret: '435jdsklfjslfdsljjflsdjdlsjfsl' )

    expect(SendMessageToQueue.generate_message(user.id, "bar", "NYC" )).to eq "#{user.email},#{token.oauth_token},#{token.oauth_secret},bar,NYC"

  end


  it "should post to the queue" do
    category = Category.create(name: "bar")
    city = City.create(:name => "NYC")
    user = User.create(:email => "test@test.com", :password => "password@123", :password_confirmation => "password@123" )
    UserCategory.create(user_id: user.id, category_id: category.id)
    UserCity.create(user_id: user.id, city_id: city.id)
    token = Token.create(user_id: user.id, oauth_token: 'rhdskdfhdks', oauth_secret: '435jdsklfjslfdsljjflsdjdlsjfsl' )

    expect(SendMessageToQueue.push_message_to_queue(user.id)).to eq "Messages put on queue."

  end



end