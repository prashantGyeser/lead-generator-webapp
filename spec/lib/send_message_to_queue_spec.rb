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

  it "should convert multiple categories into a string" do
    category_bar = Category.create(name: "bar")
    category_cafe = Category.create(name: "cafe")
    user = User.create(:email => "test@test.com", :password => "password@123", :password_confirmation => "password@123" )
    UserCategory.create(user_id: user.id, category_id: category_bar.id)
    UserCategory.create(user_id: user.id, category_id: category_cafe.id)
    expect(SendMessageToQueue.get_and_convert_categories_to_string(user.id)).to eq "bar,cafe"
  end

end